# Noir Example Files

These example files demonstrate various Noir language features for testing the JetBrains plugin.

## Files

| File | Description |
|------|-------------|
| `main.nr` | Basic syntax demonstration |
| `functions.nr` | Function patterns and signatures |
| `structs.nr` | Struct definitions and implementations |
| `tests.nr` | Test patterns and assertions |
| `macros.nr` | Macro and oracle usage |

## Using These Examples

1. Create a new Noir project:
   ```bash
   nargo new my_project
   cd my_project
   ```

2. Copy an example file to `src/main.nr`:
   ```bash
   cp examples/main.nr src/main.nr
   ```

3. Open the project in your JetBrains IDE to test plugin features.

## Testing Plugin Features

### Syntax Highlighting
Open any `.nr` file and verify:
- Keywords are highlighted (fn, let, struct, etc.)
- Types are colored (Field, u32, bool, etc.)
- Comments are grayed out
- Strings are highlighted

### Code Completion
- Type `std::` and press Ctrl+Space
- Type partial function names and wait for suggestions

### Go to Definition
- Cmd/Ctrl+Click on any function name
- Cmd/Ctrl+B on struct fields

### Test Gutter Icons
- Look for test tube icons next to `#[test]` functions

### Hover Information
- Hover over function names to see type signatures
- Hover over struct fields to see types
