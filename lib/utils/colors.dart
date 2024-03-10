import 'package:flutter/material.dart';

Color orderstatusColor(String status) {
  switch (status) {
    case "PENDING":
      return Colors.amber;

    case "REJECTED":
      return Colors.grey;

    case "COMPLETED":
      return Colors.green;
    default:
      return Colors.black;
  }
}

Color warrentyStatusColor(String status) {
  switch (status) {
    case "PENDING":
      return Colors.amber;

    case "REJECTED":
      return Colors.grey;

    case "APPROVED":
      return Colors.green;
    default:
      return Colors.black;
  }
}

Color claimStatusColor(String status) {
  switch (status) {
    //
    case "CANCELED":
      return Colors.grey;
    case "CLAIMED":
      return Colors.green;
//
    case "REQUESTED":
      return Colors.grey;

    case "ONGOING":
      return Colors.amber;
    default:
      return Colors.black;
  }
}
