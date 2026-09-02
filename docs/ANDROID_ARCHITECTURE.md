# FORENZA-app System Architecture

## Architectural Overview
The FORENZA Android Field Application utilizes a strict Feature-Driven Architecture within Flutter. It decouples the Presentation (UI) from Business Logic (Core Services), delegating absolute authority for offline persistence to an encrypted SQLite vault and real-time syncing to the Supabase backend.

```mermaid
graph TD
    %% User Tier
    Officer[Investigating Officer]
    
    %% Flutter Application Tier
    subgraph "FORENZA-app (Flutter Framework)"
        UI[Presentation Layer<br/>Widgets & Views]
        Router[GoRouter<br/>Role-Based Routing]
        State[Riverpod Providers<br/>State Management]
        
        subgraph "Core Services (Domain Logic)"
            CaptureEngine[Capture Engine<br/>Camera & GPS]
            CryptoEngine[Crypto Engine<br/>SHA-256 Hashing]
            SyncEngine[Sync Engine<br/>Queue Management]
        end
    end
    
    %% Backend/Infrastructure Tier
    subgraph "Device Infrastructure"
        Vault[(Offline Vault<br/>AES-256 SQLite)]
        FileSystem[Encrypted Media Storage]
    end
    
    subgraph "Cloud Infrastructure"
        Supabase[(Supabase Backend)]
        AI[Groq/NVIDIA LLM<br/>via Web API Proxy]
    end
    
    %% Connections
    Officer -->|Interacts| UI
    UI --> Router
    UI --> State
    State --> CaptureEngine
    State --> CryptoEngine
    State --> SyncEngine
    
    CaptureEngine -->|Generates Media| FileSystem
    CryptoEngine -->|Secures Metadata| Vault
    
    SyncEngine -.->|Background Sync| Supabase
    CaptureEngine -.->|AI Classification| AI
```

## Key Architectural Decisions

### 1. Offline-First Design
Field officers often operate in zero-connectivity environments (e.g., deep inside buildings, rural areas). The `Offline Vault` is the absolute source of truth for the mobile application. The `SyncEngine` acts strictly as an idempotent background worker that drains the queue when connectivity is restored.

### 2. Immutability at Capture
The `CryptoEngine` intercepts the binary image data *before* it is written to the device storage, calculating the SHA-256 hash in volatile memory. This guarantees that the hash recorded in the database exactly matches the optical capture, defeating attempts to swap the image on disk.

### 3. State Decoupling
By heavily utilizing `Riverpod`, UI components never mutate data directly. They listen to streams (e.g., Sync Progress, Vault Inventory) provided by the Core Services, ensuring the UI always reflects the true system state without race conditions.
