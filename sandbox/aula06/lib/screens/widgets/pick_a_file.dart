import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PickAFile extends StatefulWidget {
  final Function(Uint8List?)? onSaved;
  final Function(Uint8List?)? validator;

  const PickAFile({super.key, this.onSaved, this.validator});

  @override
  State<PickAFile> createState() => _PickAFileState();
}

class _PickAFileState extends State<PickAFile> {
  Uint8List? fileBytes;

  @override
  Widget build(BuildContext context) {
    return FormField(onSaved: (newValue) {
      if (widget.onSaved != null) {
        widget.onSaved!(fileBytes);
      }
    }, validator: (value) {
      if (widget.validator != null) {
        return widget.validator!(fileBytes);
      }
      return null;
    }, builder: (field) {
      return Row(
        children: [
          SizedBox(
              width: 200,
              height: 200,
              child: fileBytes != null
                  ? Image.memory(fileBytes!)
                  : const Text("Escolha uma imagem")),
          ElevatedButton(onPressed: pickAFile, child: const Text("PickAFile"))
        ],
      );
    });
  }

  pickAFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      withData: true,
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['jpg', 'gif', 'png'],
    );

    if (result != null) {
      setState(() {
        fileBytes = result.files.first.bytes;
      });
    } else {
      setState(() {
        fileBytes = null;
      });
      // User canceled the picker
    }
  }
}
