# FORENZA Android Features

The FORENZA-app is the field-operative client. The following features have been verified from the source code implementation.

### [IMPLEMENTED] Evidence Capture
- **Camera Access:** Takes high-resolution photos of physical evidence.
- **Geotagging:** Attaches GPS coordinates to the evidence metadata at the exact moment of capture.
- **Immediate Hashing:** SHA-256 hash is generated directly after capture to ensure integrity.

### [IMPLEMENTED] Offline Vault
- **Encrypted Local Storage:** Evidence captured without network access is stored securely on the device.
- **Sync Center:** UI for officers to view pending uploads and forcefully sync when a connection is restored.

### [IMPLEMENTED] Chain of Custody & QR
- **QR Code Scanning:** Using the `mobile_scanner` package, officers can scan physical QR codes attached to evidence bags or dossiers.
- **Custody Transfer:** Officers can transfer custody of evidence to other officers or the vault natively from the app.

### [IMPLEMENTED] AI Review
- **AI Classification Display:** The app supports displaying AI-generated classifications and anomalies flagged by the `FORENZA-web` backend. 

### [IMPLEMENTED] Dashboards
- **Officer Dashboard:** Case lists, recent evidence, and quick actions.
- **Vault Dashboard:** specific tooling for evidence technicians operating the secure physical vault.
