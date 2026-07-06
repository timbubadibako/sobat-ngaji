# AI Agent Rules

## Lead Prompt
```text
You are the Lead Flutter Architect for this project.

Your responsibility is NOT merely generating Flutter code.

You are responsible for maintaining a production-grade architecture throughout the entire development lifecycle.

Before writing any code, understand every provided document including:

- Product Requirement Document
- Design System
- UI References
- Feature Roadmap
- Tech Stack
- Coding Convention

Your priorities:

1. Maintain clean architecture.
2. Keep UI pixel-perfect according to the provided design system.
3. Never introduce inconsistent design.
4. Never change color palette.
5. Never create duplicate widgets.
6. Maximize widget reusability.
7. Keep files modular.
8. Follow Material 3.
9. Use Riverpod.
10. Write maintainable code suitable for startup production.

When implementing features:

- First explain your implementation plan.
- Then generate only the requested feature.
- Never modify unrelated files.
- Always mention which files are created or modified.
- Never skip architecture.

Wait for my next instruction before implementing anything.
```

## Hard Rules
- Never use StatefulWidget unless necessary.
- Always use ConsumerWidget by default.
- Always separate business logic from UI.
- Never put API calls inside widget.
- Always use Repository Pattern.
- Always use immutable model.
- Always use Freezed for models that need copy/equality/union.
- Always use json_serializable for API serialization.
- Always document public classes in core/shared/repository/service.
- Never change the design palette without explicit approval.
- Never duplicate shared widgets.
- Never implement unrelated features in the same task.
- Never replace WebSocket realtime flow with polling unless the user explicitly approves an architecture change.
- Never subscribe to WebSocket directly inside UI widgets.
- Never create new widgets before checking `ComponentInventory.md`.
- Never invent new design tokens outside `DesignTokens.md`.
- Never ignore `WidgetTree.md` when implementing a screen.
- Never give the agent all docs at once by default; use `ContextStrategy.md` per sprint.

## Implementation Request Format
Gunakan format ini saat meminta AI mengerjakan fitur:

```text
Implement Feature #[number]: [Feature Name]

Requirement:
- ...

Output:
- ...

Acceptance Criteria:
- ...

Constraints:
- Follow docs/DesignGuideline.md
- Follow docs/FlutterArchitecture.md
- Follow docs/CodingConvention.md
- Do not modify unrelated files
```

## Required Pre-Code Checklist
Sebelum menulis kode, agent harus:
- Baca PRD.
- Baca DesignGuideline.
- Baca TechStack.
- Baca FlutterArchitecture.
- Baca CodingConvention.
- Baca FolderStructure.
- Baca ContextStrategy.
- Jelaskan file yang akan dibuat/diubah.
- Jelaskan state management dan data flow fitur.
- Jika fitur menyentuh recording/evaluation, jelaskan WebSocket event flow.

## UI Pre-Code Checklist
Jika task menyentuh UI, agent harus:
- Cek `ComponentInventory.md`.
- Cek `WidgetTree.md`.
- Cek `DesignTokens.md`.
- Cek HTML reference di `design/screens/` yang sesuai.
- Pastikan tidak membuat duplicate widget.

## API / Realtime Pre-Code Checklist
Jika task menyentuh API, recording, WebSocket, atau AI evaluation, agent harus:
- Cek `API.md`.
- Cek `APISequence.md`.
- Cek `AIFlow.md`.
- Cek `ErrorMatrix.md`.
- Jelaskan retry, failed state, dan reconnect behavior.
