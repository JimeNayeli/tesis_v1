import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:tesis_v1/core/configs/constants/app_urls.dart';

class FacebookPostsWidget extends StatefulWidget {
  const FacebookPostsWidget({Key? key}) : super(key: key);

  @override
  _FacebookPostsWidgetState createState() => _FacebookPostsWidgetState();
}

class _FacebookPostsWidgetState extends State<FacebookPostsWidget> {
  List<dynamic> _posts = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadPosts();
  }

  Future<void> _loadPosts() async {
    try {
      // Obtener el token de acceso actual
      final AccessToken? accessToken = await FacebookAuth.instance.accessToken;
      
      if (accessToken == null) {
        throw Exception('Error. No hay token de acceso disponible');
      }

      // Hacer la petición a la Graph API
      final response = await http.get(
        Uri.parse(
          '${AppURLs.getPosts}${accessToken.tokenString}'
        ),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _posts = data['data'];
          _loading = false;
        });
      } else {
        throw Exception('Error al cargar los posts: ${e.toString()} ${response.statusCode}');
      }
    } catch (e) {
      setState(() {
        _loading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_posts.isEmpty) {
      return const Center(child: Text('No hay posts disponibles'));
    }

    return ListView.builder(
      itemCount: _posts.length,
      itemBuilder: (context, index) {
        final post = _posts[index];
        return Card(
          margin: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (post['full_picture'] != null)
                  Image.network(
                    post['full_picture'],
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                const SizedBox(height: 8),
                if (post['message'] != null)
                  Text(
                    post['message'],
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                const SizedBox(height: 8),
                Text(
                  'Publicado: ${DateTime.parse(post['created_time']).toLocal()}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}