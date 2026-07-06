# Context Strategy

Dokumen ini mengikuti catatan `docs/BikininIni.md`: jangan memberi agent semua file sekaligus. Berikan konteks bertahap sesuai sprint agar agent fokus dan tidak overwhelmed.

## Base Context
Selalu berikan:
```text
docs/README.md
docs/PRD.md
docs/DesignGuideline.md
docs/DesignTokens.md
docs/FlutterArchitecture.md
docs/FolderStructure.md
docs/CodingConvention.md
docs/FeatureRoadmap.md
docs/AIRules.md
```

## Sprint 1: Authentication
Tambahkan:
```text
docs/API.md
docs/Database.md
docs/ErrorMatrix.md
```

## Sprint 2: Home
Tambahkan:
```text
docs/ComponentInventory.md
docs/WidgetTree.md
docs/UIGuideline.md
docs/AnimationGuide.md
design/screens/home.html
```

## Sprint 3: Practice
Tambahkan:
```text
docs/FlowDiagram.md
docs/APISequence.md
docs/ComponentInventory.md
docs/WidgetTree.md
design/screens/practice.html
```

## Sprint 4: Realtime Recording
Tambahkan:
```text
docs/APISequence.md
docs/AIFlow.md
docs/ErrorMatrix.md
docs/AnimationGuide.md
design/screens/recording.html
```

## Sprint 5: AI Evaluation
Tambahkan:
```text
docs/AIFlow.md
docs/API.md
docs/APISequence.md
docs/ErrorMatrix.md
docs/WidgetTree.md
design/screens/evaluation.html
```

## Sprint 6: Insight
Tambahkan:
```text
docs/AIFlow.md
docs/Database.md
docs/ComponentInventory.md
docs/WidgetTree.md
design/screens/insight.html
```

## Sprint 7: Profile
Tambahkan:
```text
docs/ComponentInventory.md
docs/WidgetTree.md
design/screens/profile.html
```

## Sprint 8: Optimization
Tambahkan:
```text
docs/DefinitionOfDone.md
docs/TestingStandard.md
docs/GitWorkflow.md
docs/ErrorMatrix.md
docs/AnimationGuide.md
```

## Rule
Jika agent membutuhkan dokumen tambahan, agent harus menyebut alasannya sebelum membaca atau mengubah banyak area sekaligus.

