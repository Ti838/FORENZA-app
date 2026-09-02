# User Roles & Workflows

## 1. Investigating Officer
- **Purpose:** Primary field user capturing digital evidence.
- **Workflow:** 
  1. Opens App -> Selects Case.
  2. Opens Camera -> Captures Photo.
  3. App immediately tags with GPS and generates SHA-256 hash.
  4. Stores encrypted photo to Offline Vault.
  5. Syncs to Supabase when network is restored.

## 2. Vault Custodian
- **Purpose:** Responsible for secure evidence custody management.
- **Workflow:** 
  1. Opens Vault Dashboard.
  2. Receives incoming physical evidence.
  3. Scans QR code or matches evidence ID.
  4. Records chain-of-custody transfer.

## 3. Forensic Laboratory
- **Purpose:** Conducts forensic analysis on verified evidence.
- **Workflow:** 
  1. Logs into Lab Dashboard.
  2. Verifies integrity of transferred evidence using SHA-256 hash.
  3. Records findings and attaches lab notes.

## 4. Supervisor
- **Purpose:** Manages team and oversees investigation timelines.
- **Capabilities:** Can view all active cases, timelines, and audit logs for their team, but cannot actively capture or delete evidence.

## 5. Judicial Chamber
- **Purpose:** Legal and judicial review of verified evidence dossiers.
- **Capabilities:** Read-only access to strictly verified evidence, chain of custody logs, and PDF reports.

## 6. Compliance Officer
- **Purpose:** Audits the system for security and procedural compliance.
- **Capabilities:** Access to system-wide audit logs, login history, and integrity failure events.

## 7. System Administrator
- **Purpose:** IT Administration.
- **Capabilities:** User management, device revocation, and system configuration. Cannot alter evidence history (prevented by backend RLS).
