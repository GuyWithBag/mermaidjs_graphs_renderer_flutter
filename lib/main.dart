import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: MermaidEditorScreen()));
}

class MermaidEditorScreen extends StatefulWidget {
  const MermaidEditorScreen({Key? key}) : super(key: key);

  @override
  State<MermaidEditorScreen> createState() => _MermaidEditorScreenState();
}

class _MermaidEditorScreenState extends State<MermaidEditorScreen> {
  bool isAutoPreview = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 1. TOP NAVBAR
      appBar: AppBar(
        title: const Text('New Graph'),
        actions: [
          IconButton(icon: const Icon(Icons.save), onPressed: () {}),
          IconButton(icon: const Icon(Icons.undo), onPressed: () {}),
          IconButton(icon: const Icon(Icons.redo), onPressed: () {}),
          IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),

      // 2. MAIN CONTENT
      body: Column(
        children: [
          // --- TOP HALF: Editor Workspace ---
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Left Sidebar Tools
                SizedBox(
                  width: 50,
                  child: Column(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.list),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.circle_outlined),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.crop_square),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.diamond_outlined),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                const VerticalDivider(width: 1),
                // Code Editor Area
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      maxLines: null,
                      expands: true,
                      textAlignVertical: TextAlignVertical.top,
                      decoration: const InputDecoration(
                        hintText:
                            'graph TD;\n  A[Start] --> B{Is it working?};',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // --- MIDDLE: Control Bar ---
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Text('Auto-Preview:'),
                    Switch(
                      value: isAutoPreview,
                      onChanged: (val) {
                        setState(() {
                          isAutoPreview = val;
                        });
                      },
                    ),
                  ],
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: const Text('Beautify Code'),
                ),
              ],
            ),
          ),
          const Divider(height: 1),

          // --- BOTTOM HALF: Compiler/Renderer Preview ---
          Expanded(
            flex: 1,
            child: Center(
              // Placeholder for the rendered MermaidJS output
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.image, size: 64, color: Colors.grey),
                  Text('MermaidJS Render Preview'),
                ],
              ),
            ),
          ),
        ],
      ),

      // 3. BOTTOM NAVBAR
      // Using a BottomAppBar with a centered notch to allow the FAB to overlap seamlessly
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 6.0,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Left Action
              InkWell(
                onTap: () {},
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.folder_open),
                    Text('Saved Graphs', style: TextStyle(fontSize: 10)),
                  ],
                ),
              ),

              // Empty space to accommodate the floating button
              const SizedBox(width: 60),

              // Right Action
              InkWell(
                onTap: () {},
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.account_circle),
                    Text('Account Screen', style: TextStyle(fontSize: 10)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      // 4. FLOATING ACTION BUTTON (Center Render Button)
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(
          top: 20.0,
        ), // Nudges the label down slightly
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                /* Compile/Render Action */
              },
              elevation: 2,
              child: const Icon(Icons.play_arrow),
            ),
            const SizedBox(height: 2),
            const Text(
              'Editor/Compiler',
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
