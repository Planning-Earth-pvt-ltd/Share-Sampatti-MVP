import 'package:share_sampatti_mvp/app/app.dart';

class ChatBotScreen extends ConsumerStatefulWidget {
  const ChatBotScreen({super.key});

  @override
  ConsumerState<ChatBotScreen> createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends ConsumerState<ChatBotScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(chatBotProvider.notifier).startAssistant();
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  _scrollToBottom() {
    Future.delayed(Duration(milliseconds: 50), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 200),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final appDimensions = ref.watch(appDimensionsProvider);
    final chatBot = ref.watch(chatBotProvider);
    List<Map<String, dynamic>> assistant = chatBot.assistant;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (assistant.isNotEmpty) _scrollToBottom();
    });

    buildAvatar(String image) {
      return CircleAvatar(
        radius: 20,
        backgroundColor: Colors.white,
        backgroundImage: AssetImage(image),
      );
    }

    buildMessage(bool isAssist, int index) {
      return Expanded(
        child: Column(
          crossAxisAlignment: isAssist
              ? CrossAxisAlignment.start
              : CrossAxisAlignment.end,
          children: [
            Inter(
              text: isAssist ? "M.A.Y.A" : "Shubham",
              fontSize: appDimensions.fontXXS,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(height: appDimensions.verticalSpaceXS),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: isAssist
                    ? Theme.of(context).colorScheme.primary
                    : AppColors.darkGrey,
                borderRadius: BorderRadius.circular(appDimensions.radiusS),
              ),
              child: chatBot.isLoading && (index == assistant.length - 1)
                  ? CircularProgressIndicator(color: AppColors.darkGrey)
                  : Inter(
                      text: isAssist
                          ? assistant[index]["message"]
                          : assistant[index]["label"],
                      color: isAssist ? AppColors.black : null,
                      fontSize: appDimensions.fontS,
                      fontWeight: FontWeight.w500,
                    ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: CustomAppBar.appbar(context, "M.A.Y.A"),
      body: assistant.isEmpty
          ? Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).colorScheme.primary,
              ),
            )
          : ListView.builder(
              controller: _scrollController,
              itemCount: assistant.length,
              itemBuilder: (context, index) {
                bool isAssist = (index % 2 == 0);

                return Padding(
                  padding: EdgeInsets.only(
                    top: appDimensions.verticalPaddingS,
                    bottom: appDimensions.verticalPaddingS,
                    left: isAssist
                        ? appDimensions.horizontalPaddingS
                        : appDimensions.horizontalPaddingL,
                    right: isAssist
                        ? appDimensions.horizontalPaddingL
                        : appDimensions.horizontalPaddingS,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: isAssist
                        ? [
                            buildAvatar(AppAssets.chatNowAssistant),
                            SizedBox(width: appDimensions.horizontalSpaceXS),
                            buildMessage(isAssist, index),
                          ]
                        : [
                            buildMessage(isAssist, index),
                            SizedBox(width: appDimensions.horizontalSpaceXS),
                            buildAvatar(AppAssets.chatNowUser),
                          ],
                  ),
                );
              },
            ),
      bottomNavigationBar: (assistant.isNotEmpty && !chatBot.isLoading)
          ? SizedBox(
              height: 70,
              child: ListView.builder(
                itemCount: assistant.last["options"].length,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(
                  left: appDimensions.horizontalPaddingS,
                  top: appDimensions.verticalPaddingS,
                  bottom: appDimensions.verticalPaddingS,
                ),
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.only(
                    right: appDimensions.horizontalPaddingS,
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      ref
                          .read(chatBotProvider.notifier)
                          .nextInstruction(assistant.last["options"][index]);
                      _scrollToBottom();
                    },
                    style: ElevatedButton.styleFrom(),
                    child: Inter(
                      text: assistant.last["options"][index]["label"],
                      fontSize: appDimensions.fontXS,
                    ),
                  ),
                ),
              ),
            )
          : null,
    );
  }
}
