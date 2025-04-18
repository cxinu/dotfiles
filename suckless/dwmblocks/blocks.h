typedef struct {
	const char *icon;
	const char *command;
	unsigned int interval;
	unsigned int signal;
} Block;

static const Block blocks[] = {
	// Icon, Command, Update Interval, Update Signal
	{" ", "free -h | awk '/^Mem/ { print $3\"/\"$2 }' | sed 's/i//g'", 5, 0},
	{"", "dwm-volume", 0, 14},
	{"", "dwm-battery", 1, 0},
	{"", "date '+%b %d (%a) %I:%M%p '", 30, 0},
};

static char delim[] = " | ";
static unsigned int delimLen = 3;
