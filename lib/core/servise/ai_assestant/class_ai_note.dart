import 'dart:convert';
import 'dart:developer';

import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:intl/intl.dart';
import 'package:pro_todo/core/model/node_model.dart';
import 'package:uuid/uuid.dart';

class AiNote {
  //   remove api key from constructor and make it env var or secret not now

  Future<NoteModel> extractNote(String text) async {
    try {
      final GenerativeModel model;
      model = GenerativeModel(
        model: 'gemini-3.6-flash',
        apiKey: 'AQ.Ab8RN6JqBle7QrKN8S0APS2-WrwxQlJZBms5KzKutkZRYwpGuw',
        generationConfig: GenerationConfig(
          responseMimeType: 'application/json',
        ),
        systemInstruction: Content.system(
          'You are a note-taking assistant. '
          'The user will give you raw speech text along with the current date and time. '
          'Extract a unique id for the note (it must be random string), '
          ' a clear title, a description, and figure out the relevant date/time from context. '
          'If the user mentions relative times like "tomorrow", "next week", "at 9am", etc., '
          'calculate the actual date/time based on the provided current time. '
          'If no specific time is mentioned, use the provided current time. '
          'Return ONLY a JSON object with exactly these keys:\n'
          '{\n'
          '  "noteId": "unique id",\n'
          '  "noteTitle": "short clear title",\n'
          '  "noteDescription": "cleaned up description",\n'
          '  "createdAt": "yyyy-MM-dd/HH:mm:ss"\n'
          '}\n'
          'Do NOT add any extra keys. Do NOT wrap in an array.',
        ),
      );
      final currentDateTime = DateFormat(
        "yyyy-MM-dd'T'HH:mm:ss",
      ).format(DateTime.now());
      final response = await model.generateContent([
        Content.text('Current time: $currentDateTime\n\nUser said: $text'),
      ]);
      final rawJson = response.text;
      log('rawJson Ai Response: ${rawJson.toString()}');
      if (rawJson == null || rawJson.isEmpty) {
        return NoteModel(noteTitle: text);
      }
      final Map<String, dynamic> data = jsonDecode(rawJson);
      return NoteModel(
        noteId: data['noteId'] ?? const Uuid().v4(),
        noteTitle: data['noteTitle'] ?? text,
        noteDescription: data['noteDescription'] ?? '',
        createdAt: DateTime.tryParse(data['createdAt'] ?? currentDateTime),
      );
    } catch (e) {
      if (e.toString().contains('429') && e.toString().contains('quota')) {
        throw Exception(
          'API Limit Reached , Try Again Later or add note manually',
        );
      } else if (e.toString().contains('429')) {
        throw Exception(
          'Too many requests , Try Again Later or add note manually',
        );
      } else if (e.toString().contains('503')) {
        throw Exception(
          'Server Error , Try Again Later Status IS Unavailable 503',
        );
      } else if (e.toString().contains('404')) {
        throw Exception('API Not Found , Try Again Later or add note manually');
      } else if (e.toString().contains('Untitle')) {
        throw Exception('Untitle , please speek to mic again');
      } else {
        throw Exception(
          'Failed to extract note check  your plan: ${e.toString()}',
        );
      }
    }
  }
}
