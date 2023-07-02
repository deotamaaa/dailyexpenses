import 'package:dailyexpenses/src/utils/spacers.dart';
import 'package:flutter/material.dart';

Widget formInput({
  keyboardType,
  maxLines,
  validator,
  onSaved,
  onTap,
  fieldSubmitted,
  prefixIcon,
  inputAction,
  focusNode,
  suffixIcon,
  controller,
  obsecureText = false,
  maxLength,
  hint,
  onChanged,
  readOnly = false,
  inputFormatters,
  autoFocus = false,
  TextAlign textAlign = TextAlign.start,
  autoValidateMode,
  required String formName,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(formName, style: const TextStyle(fontSize: 14.0)),
      spaceHeight(height: 8.0),
      TextFormField(
        keyboardType: keyboardType,
        cursorColor: Colors.black,
        autovalidateMode: autoValidateMode,
        controller: controller,
        inputFormatters: inputFormatters,
        obscureText: obsecureText,
        autofocus: autoFocus,
        textInputAction: inputAction,
        onFieldSubmitted: fieldSubmitted,
        maxLength: maxLength,
        focusNode: focusNode,
        readOnly: readOnly,
        textAlign: textAlign,
        style: const TextStyle(
          fontSize: 14.0,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          hintText: hint,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 14.0,
            horizontal: 14.0,
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
        ),
        validator: validator,
        onSaved: onSaved,
        onChanged: onChanged,
        onTap: onTap,
      ),
      spaceHeight(height: 12.0),
    ],
  );
}
