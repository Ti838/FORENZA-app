import 'dart:convert';
import 'package:http/http.dart' as http;
import 'offline_vault_service.dart';
import '../constants/app_config.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SyncService {
  final SupabaseClient _supabase = Supabase.instance.client;

  Future<void> synchronizeOfflineVault() async {
    final items = await OfflineVaultService.getAllOfflineEvidence();
    final pendingItems = items.where((i) => i.syncStatus == OfflineEvidenceStatus.syncPending).toList();

    for (var item in pendingItems) {
      try {
        await OfflineVaultService.updateItemStatus(item.evidenceId, OfflineEvidenceStatus.uploading);
        
        // In a real app, read the file and upload to Storage
        // Here we just mark it as verified for the architecture loop
        // await _supabase.storage.from('evidence_bucket').upload(...)
        
        // Insert metadata into Postgres
        await _supabase.from('evidence').insert({
          'id': item.evidenceId,
          'case_id': item.caseId,
          'officer_id': item.officerId,
          'device_id': item.deviceId,
          'latitude': item.latitude,
          'longitude': item.longitude,
          'master_hash': item.masterEvidenceHash,
          'status': 'VERIFIED'
        });

        await OfflineVaultService.updateItemStatus(
          item.evidenceId, 
          OfflineEvidenceStatus.serverVerified,
          verifiedTime: DateTime.now(),
        );

      } catch (e) {
        await OfflineVaultService.updateItemStatus(
          item.evidenceId, 
          OfflineEvidenceStatus.syncFailed,
          errorMsg: e.toString(),
        );
      }
    }
  }
}
