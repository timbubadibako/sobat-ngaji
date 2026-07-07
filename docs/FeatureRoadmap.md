# Feature Roadmap

## Sprint 1: Authentication
Implement Feature #1: Authentication

Requirement:
- User can sign up.
- User can sign in.
- User can logout.
- App can restore session on startup.

Output:
- Auth repository.
- Auth provider/controller.
- Login screen.
- Signup screen.
- Session restore flow.
- GoRouter auth redirect.

Acceptance Criteria:
- App can determine authenticated or unauthenticated state.
- UI does not call API directly.
- Session restore works when app starts.
- Loading, error, and success states are handled.
- Flutter analyze should pass.

Constraints:
- Follow all Sobat Mengaji docs.
- Do not modify unrelated features.
- Use mock API if backend is unavailable.

## Sprint 2: Home
Implement Feature #2: Home

Requirement:
- Home displays Daily Qira as the main hero entry point.
- Home displays personal AI greeting.
- Home displays weekly snapshot.
- Home displays continue practice and AI recommendation preview.

Output:
- Home feature.
- DailyQiraHero widget.
- AI greeting component.
- Weekly snapshot component.
- Continue practice card.
- AI recommendation preview.
- Home controller/provider.
- Home repository with mock data if backend is unavailable.

Acceptance Criteria:
- Daily Qira is the strongest visual element on the first viewport.
- Bottom navigation active state works on Home.
- Data comes from provider/repository, not hardcoded directly in final widgets.
- UI follows DesignGuideline and UIGuideline.
- Loading, empty, error, and success states are handled.
- Flutter analyze should pass.

Constraints:
- Do not create Daily Qira as a navbar item.
- Main navigation remains Home, Practice, Insight, Profile.
- Do not modify unrelated features.

## Sprint 3: Practice
Implement Feature #3: Practice

Requirement:
- User can view practice items.
- User can search or browse surah/ayah practice materials.
- User can open practice detail.
- User can play reference audio.
- User can enter recording flow from practice detail.

Output:
- Practice list screen.
- Practice detail screen.
- Practice item model.
- Practice repository.
- Practice controller/provider.
- Reference audio service abstraction.
- Surah/Ayah card components.
- Route integration through GoRouter.

Acceptance Criteria:
- Practice item data comes from repository.
- Audio service is separated from UI.
- UI does not call API directly.
- Practice detail shows Arabic text clearly.
- Reference audio control is close to Arabic text.
- Loading, empty, error, and success states exist.
- Flutter analyze should pass.

Constraints:
- Follow feature-first architecture.
- Do not implement recording logic yet except navigation entry point.
- Do not modify unrelated features.

## Sprint 4: Realtime Recording
Implement Feature #4: Realtime Recording

Requirement:
- User can request microphone permission.
- User can start recording.
- User can see recording duration.
- User can see waveform or visual audio feedback.
- User can stop and submit recording.
- Recording lifecycle uses WebSocket event flow or mock WebSocket adapter.

Output:
- Recording feature.
- Recording screen or recording panel.
- Audio recorder service abstraction.
- Microphone permission handling.
- Realtime WebSocket service interface.
- Mock WebSocket adapter if backend is unavailable.
- Recording controller/provider.
- Recording state model.
- Recording UI components.

Acceptance Criteria:
- Permission microphone is handled clearly.
- UI shows recording duration.
- Recording state is explicit: idle, permissionRequired, recording, paused, uploading, processing, completed, failed.
- WebSocket events flow through service → repository → controller → UI.
- Widgets do not subscribe to WebSocket directly.
- User can retry after failed state.
- Flutter analyze should pass.

Constraints:
- Do not use polling as default realtime architecture.
- Do not put recorder logic inside widget.
- Do not implement AI evaluation result UI yet unless required as placeholder.
- Do not modify unrelated features.

## Sprint 5: AI Evaluation
Implement Feature #5: AI Evaluation

Requirement:
- Submitted recording can be processed into an evaluation result.
- Evaluation progress is received through WebSocket events.
- User can see score, confidence, highlight, summary, and recommendation.
- User can retry or continue after result.

Output:
- Evaluation repository.
- Evaluation service interface.
- Mock evaluation service if backend is unavailable.
- Evaluation result model.
- Highlight segment model.
- Letter insight model.
- Evaluation controller/provider.
- Evaluation result screen/components.
- Score card.
- Highlighted Arabic text component.
- AI feedback card.
- Retry and continue actions.

Acceptance Criteria:
- Result shows matchScore.
- Result shows confidenceLevel.
- Result shows summary and recommendation.
- Result shows highlight segments with semantic status.
- Copy uses “evaluasi awal”, “AI menemukan…”, “perlu dicek”, and “coba ulangi bagian ini”.
- Copy does not use absolute AI claims.
- Failed state can retry.
- Processing/completed/failed states follow WebSocket event contract.
- Flutter analyze should pass.

Constraints:
- MVP does not claim full tajwid correction.
- MVP does not claim real-time per-letter correction unless proven.
- Do not modify unrelated features.

## Sprint 6: Insight
Implement Feature #6: Insight

Requirement:
- User can see weekly score.
- User can see weekly trend.
- User can see letter mastery.
- User can see smart suggestion.
- Insight should answer what the user needs to practice next.

Output:
- Insight screen.
- Insight repository.
- Insight controller/provider.
- Weekly report model.
- Letter mastery model.
- Weekly trend chart component.
- Letter accuracy visualization.
- AI insight narrative card.
- Smart suggestion card.

Acceptance Criteria:
- User can clearly see which letter or segment needs more practice.
- Visualizations are meaningful, not decorative only.
- AI insight feels personal and helpful.
- Data comes from repository/provider.
- Loading, empty, error, and success states exist.
- UI follows DesignGuideline and UIGuideline.
- Flutter analyze should pass.

Constraints:
- Do not make Insight a generic dashboard.
- Do not overload screen with too many numbers.
- Do not modify unrelated features.

## Sprint 7: Profile
Implement Feature #7: Profile

Requirement:
- User can see profile identity.
- User can see learning summary.
- User can see preferences.
- User can logout.
- Profile should remain simple and not become a random settings dump.

Output:
- Profile screen.
- Profile repository if needed.
- Profile controller/provider.
- Learning summary component.
- Preferences component.
- Logout action.
- Profile route and bottom nav integration.

Acceptance Criteria:
- Profile shows user identity.
- Profile shows simple learning summary.
- Preferences can be stored locally or remotely depending on backend readiness.
- Logout works if auth is active.
- UI follows DesignGuideline.
- Flutter analyze should pass.

Constraints:
- Do not add unrelated features.
- Do not move Insight features into Profile.
- Profile must remain lightweight.

## Sprint 8: Optimization
Implement Feature #8: Optimization, Testing, and Polish

Requirement:
- Stabilize performance.
- Improve accessibility.
- Add tests for main flows.
- Polish loading, empty, error, and success states.
- Ensure UI consistency across Home, Practice, Recording, Evaluation, Insight, and Profile.

Output:
- Unit tests for key controllers/repositories.
- Widget tests for important UI states.
- Manual QA checklist.
- Accessibility improvements.
- Reduced motion handling if motion exists.
- Error copy polish.
- Performance cleanup.
- Dead code cleanup.

Acceptance Criteria:
- flutter analyze passes.
- dart format passes.
- flutter test passes.
- Main user flow works:
  Home → Daily Qira → Practice → Recording → Evaluation → Insight.
- No widget calls API directly.
- No business logic inside widgets.
- No duplicate shared components.
- Palette, spacing, radius, and typography stay consistent.
- Main async flows have loading, empty, error, and success states.

Constraints:
- Do not introduce new product features.
- Do not change architecture without approval.
- Do not change palette without approval.

