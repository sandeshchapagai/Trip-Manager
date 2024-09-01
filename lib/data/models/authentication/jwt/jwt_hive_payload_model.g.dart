// // GENERATED CODE - DO NOT MODIFY BY HAND
//
// part of 'jwt_hive_payload_model.dart';
//
// // **************************************************************************
// // TypeAdapterGenerator
// // **************************************************************************
//
// import 'package:hive/hive.dart';
//
// import 'jwt_hive_payload_model.dart';
//
// class JwtHivePayloadModelAdapter extends TypeAdapter<JwtHivePayloadModel> {
//   @override
//   final int typeId = 0;
//
//   @override
//   JwtHivePayloadModel read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return JwtHivePayloadModel(
//       userId: fields[0] as String?,
//       restaurantId: fields[1] as String?,
//       role: fields[2] as String?,
//       permissions: (fields[3] as List?)?.cast<Permission>(),
//       iat: fields[4] as int?,
//       exp: fields[5] as int?,
//     );
//   }
//
//   @override
//   void write(BinaryWriter writer, JwtHivePayloadModel obj) {
//     writer
//       ..writeByte(6)
//       ..writeByte(0)
//       ..write(obj.userId)
//       ..writeByte(1)
//       ..write(obj.restaurantId)
//       ..writeByte(2)
//       ..write(obj.role)
//       ..writeByte(3)
//       ..write(obj.permissions)
//       ..writeByte(4)
//       ..write(obj.iat)
//       ..writeByte(5)
//       ..write(obj.exp);
//   }
//
//   @override
//   int get hashCode => typeId.hashCode;
//
//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is JwtHivePayloadModelAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }
//
// class PermissionAdapter extends TypeAdapter<Permission> {
//   @override
//   final int typeId = 1;
//
//   @override
//   Permission read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return Permission(
//       resource: fields[0] as String?,
//       action: (fields[1] as List?)?.cast<Action>(),
//     );
//   }
//
//   @override
//   void write(BinaryWriter writer, Permission obj) {
//     writer
//       ..writeByte(2)
//       ..writeByte(0)
//       ..write(obj.resource)
//       ..writeByte(1)
//       ..write(obj.action);
//   }
//
//   @override
//   int get hashCode => typeId.hashCode;
//
//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is PermissionAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }
//
// class ActionAdapter extends TypeAdapter<Action> {
//   @override
//   final int typeId = 2;
//
//   @override
//   Action read(BinaryReader reader) {
//     switch (reader.readByte()) {
//       case 0:
//         return Action.edit;
//       case 1:
//         return Action.view;
//       default:
//         return Action.edit;
//     }
//   }
//
//   @override
//   void write(BinaryWriter writer, Action obj) {
//     switch (obj) {
//       case Action.edit:
//         writer.writeByte(0);
//         break;
//       case Action.view:
//         writer.writeByte(1);
//         break;
//     }
//   }
//
//   @override
//   int get hashCode => typeId.hashCode;
//
//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is ActionAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }
