# Sobat Ngaji Development Bible

Dokumen ini adalah source of truth untuk product, design, architecture, dan coding rules Sobat Ngaji.

## Required Reading
1. `PRD.md`
2. `DesignGuideline.md`
3. `DesignTokens.md`
4. `TechStack.md`
5. `FlutterArchitecture.md`
6. `FolderStructure.md`
7. `CodingConvention.md`
8. `FeatureRoadmap.md`
9. `AIRules.md`

## Supporting Documents
- `SRS.md`
- `API.md`
- `APISequence.md`
- `Database.md`
- `AIFlow.md`
- `FlowDiagram.md`
- `ComponentInventory.md`
- `WidgetTree.md`
- `ErrorMatrix.md`
- `AnimationGuide.md`
- `ContextStrategy.md`
- `DefinitionOfDone.md`
- `TestingStandard.md`
- `GitWorkflow.md`

## Development Bible Map
```text
01 Vision              -> PRD.md
02 Product             -> PRD.md, SRS.md
03 User Persona        -> UserPersona.md
04 UX Rules            -> UXRules.md
05 Design System       -> DesignGuideline.md, DesignTokens.md
06 Flutter Rules       -> FlutterArchitecture.md, AIRules.md
07 Architecture        -> FlutterArchitecture.md, BackendArchitecture.md
08 Folder Structure    -> FolderStructure.md
09 Naming Convention   -> CodingConvention.md
10 Coding Convention   -> CodingConvention.md
11 State Management    -> StateManagement.md
12 AI Architecture     -> AIFlow.md
13 Backend Architecture -> BackendArchitecture.md
14 API Contract        -> API.md, APISequence.md
15 Database Schema     -> Database.md
16 Feature Roadmap     -> FeatureRoadmap.md
17 Definition of Done  -> DefinitionOfDone.md
18 Testing Standard    -> TestingStandard.md
19 Git Workflow        -> GitWorkflow.md
20 UI Guideline        -> UIGuideline.md
Extra Flow Diagrams    -> FlowDiagram.md
Extra Component Rules  -> ComponentInventory.md, WidgetTree.md
Extra Error Handling   -> ErrorMatrix.md
Extra Motion           -> AnimationGuide.md
```

## Development Principle
Jangan coding dari screen. Coding dari feature.

Jangan memberi agent semua dokumen sekaligus. Gunakan `ContextStrategy.md` untuk memilih dokumen per sprint.

Contoh request yang benar:

```text
Implement Feature #1: Authentication

Requirement:
- User can sign in and restore session.

Output:
- Auth repository, provider, screen, route.

Acceptance Criteria:
- Session restore works.
- UI does not call API directly.
- Flutter analyze passes.
```

## Before Creating Widgets
Agent wajib cek:
- `ComponentInventory.md`
- `WidgetTree.md`
- `DesignTokens.md`
- `UIGuideline.md`

Tujuannya agar tidak membuat widget duplikat dan tidak mengubah visual system.
