// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminder.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ReminderAdapter extends TypeAdapter<Reminder> {
  @override
  final int typeId = 1;

  @override
  Reminder read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Reminder.oneDay;
      case 1:
        return Reminder.oneHour;
      case 2:
        return Reminder.thirtyMin;
      case 3:
        return Reminder.tenMin;
      default:
        return Reminder.oneDay;
    }
  }

  @override
  void write(BinaryWriter writer, Reminder obj) {
    switch (obj) {
      case Reminder.oneDay:
        writer.writeByte(0);
        break;
      case Reminder.oneHour:
        writer.writeByte(1);
        break;
      case Reminder.thirtyMin:
        writer.writeByte(2);
        break;
      case Reminder.tenMin:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReminderAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
