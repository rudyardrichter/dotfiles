local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

local scriptlog = {
  "import logging",
  "import sys",
  "import time",
  "",
  "",
  "class FormatterWithScriptTime(logging.Formatter):",
  "    def __init__(self, *args, **kwargs):",
  "        super().__init__(*args, **kwargs)",
  "        self.start_time = time.time()",
  "",
  "    def format(self, record):",
  "        record.script_time = f\"{time.time() - self.start_time:6.2f}\"",
  "        return super().format(record)",
  "",
  "",
  "log = logging.getLogger(__name__)",
  "log.setLevel(logging.INFO)",
  "handler = logging.StreamHandler(sys.stdout)",
  "formatter = FormatterWithScriptTime(",
  "    \"%(asctime)s %(script_time)s [%(levelname)s]: %(message)s\"",
  ")",
  "handler.setFormatter(formatter)",
  "log.addHandler(handler)",
}

ls.add_snippets(
  "python",
  {
    s("scriptlog", {t(scriptlog)}),
  }
)
