import 'package:flutter/material.dart';
import 'package:mezorn_dummy/demo/collection_divider.dart';
import 'package:mezorn_dummy/demo/collection_title.dart';
import 'package:mezorn_dummy/style/my_textfield_styles.dart';

class TextFieldsCollection extends StatefulWidget {
  const TextFieldsCollection({Key? key}) : super(key: key);

  @override
  _TextFieldsCollectionState createState() => _TextFieldsCollectionState();
}

class _TextFieldsCollectionState extends State<TextFieldsCollection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CollectionTitle(name: '[TextFormField] загварууд'),

        ///Энгийн үеийн харагдац
        TextFormField(
          decoration: const InputDecoration(
            hintText: 'Энгийн [TextFormField]',
          ),
        ),
        const CollectionDivider(),

        ///Label-тай үеийн харагдац
        TextFormField(
          decoration: const InputDecoration(
            hintText: 'Энгийн [TextFormField]',
            labelText: '[Label]-тай',
          ),
        ),
        const CollectionDivider(),

        ///Доогуур зураастай үеийн харагдац
        TextFormField(
          decoration: const InputDecoration(
            hintText: 'Доогуур зураастай',
            labelText: 'Underline border',
            focusedBorder: UnderlineInputBorder(),
            enabledBorder: UnderlineInputBorder(),
          ),
        ),
        const CollectionDivider(),

        ///Хүрээтэй үеийн харагдац
        TextFormField(
          decoration: const InputDecoration(
            hintText: 'Хүрээтэй',
            labelText: 'Outlined border',
            focusedBorder: OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(),
          ),
        ),
        const CollectionDivider(),

        ///Хүрээний загвар өөрчлөгдсөн үеийн харагдац
        TextFormField(
          decoration: const InputDecoration(
            hintText: 'Хүрээний загвар өөрчлөгдсөн',
            labelText: 'Customized outlined border',
            labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
              borderSide: BorderSide(
                color: Colors.orange,
                width: 2,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
              borderSide: BorderSide(
                color: Colors.orange,
                width: 2,
              ),
            ),
          ),
        ),
        const CollectionDivider(),

        ///Алдаатай үеийн харагдац
        TextFormField(
          decoration: const InputDecoration(
            hintText: 'Алдаатай утга оруулсан',
            labelText: 'Error',
            errorText: 'Алдаа гарсан байна шүү',
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
              borderSide: BorderSide(
                color: Colors.red,
                width: 2,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
              borderSide: BorderSide(
                color: Colors.red,
                width: 1,
              ),
            ),
          ),
        ),

        const CollectionDivider(),

        ///Prefix-тэй үеийн харагдац
        TextFormField(
          decoration: const InputDecoration(
            hintText: 'prefix text',
            labelText: 'With prefix text',
            prefixText: '+976 ',
          ),
        ),

        const CollectionDivider(),

        ///Prefix Widget-тэй үеийн харагдац
        TextFormField(
          decoration: const InputDecoration(
            hintText: 'prefix icon',
            labelText: 'With prefix icon',
            prefixIcon: Icon(Icons.verified_user),
            enabledBorder: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(),
          ),
        ),

        const CollectionDivider(),

        ///Suffix-тэй үеийн харагдац
        TextFormField(
          decoration: const InputDecoration(
            hintText: 'suffix text',
            labelText: 'With suffix text',
            suffixText: 'hp',
            enabledBorder: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(),
          ),
        ),

        const CollectionDivider(),

        ///Suffix icon-тай үеийн харагдац
        TextFormField(
          decoration: const InputDecoration(
            hintText: 'suffix icon',
            labelText: 'With suffix icon',
            suffixIcon: Icon(Icons.search),
            enabledBorder: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
