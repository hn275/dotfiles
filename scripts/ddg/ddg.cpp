#include <cstdlib>
#include <curl/curl.h>
#include <string>
#include <vector>

std::string encode_url(const std::string &url);

int main(int argc, char *argv[]) {
  if (argc == 1) {
    return 0;
  }

  std::vector<std::string> args{};
  for (int i = 1; i < argc; i++) {
    args.push_back(argv[i]);
  }

  std::string buf = args[0];
  for (long unsigned int i = 1; i < args.size(); i++) {
    buf += " " + args[i];
  }

  std::string cmd = "xdg-open \"" + encode_url(buf) + "\"";

  return system(cmd.c_str());
}

std::string encode_url(const std::string &url) {
  const auto value =
      curl_easy_escape(nullptr, url.c_str(), static_cast<int>(url.length()));
  std::string encode_value(value);
  curl_free(value);

  return "https://duckduckgo.com/?q=" + encode_value;
}
