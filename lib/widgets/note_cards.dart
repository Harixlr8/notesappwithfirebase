import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notesappwithfirebase/styles/app_styles.dart';

Widget noteCard(Function()? onTap, QueryDocumentSnapshot doc) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppStyle.cardColors[doc['color_id']],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(doc['note_title'], style: AppStyle.mainTitle),
          SizedBox(
            height: 4,
          ),
          Text(
            doc['creation_date'],
            style: AppStyle.mainTitle,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            doc['note_content'],
            style: AppStyle.mainTitle,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    ),
  );
}
