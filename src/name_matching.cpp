#include "name_matching.h"
using namespace std;

// 将名字的首字母转换为小写，其余部分保持不变
string normalize_first(const string &name) {
    if (name.empty()) return name;
    string result = name;
    result[0] = tolower(result[0]);
    return result;
}

// 计算 Levenshtein 编辑距离
int levenshtein_distance(const string &s, const string &t) {
    int n = s.size();
    int m = t.size();
    vector<vector<int>> dp(n + 1, vector<int>(m + 1, 0));
    for (int i = 0; i <= n; ++i) {
        dp[i][0] = i;
    }
    for (int j = 0; j <= m; ++j) {
        dp[0][j] = j;
    }
    for (int i = 1; i <= n; ++i) {
        for (int j = 1; j <= m; ++j) {
            int cost = (s[i - 1] == t[j - 1]) ? 0 : 1;
            dp[i][j] = min({ dp[i - 1][j] + 1,
                             dp[i][j - 1] + 1,
                             dp[i - 1][j - 1] + cost });
        }
    }
    return dp[n][m];
}

// 在候选名字列表中找到与输入名字最相似的名字，忽略首字母的大小写差异。
// 返回一个 pair，first 为最佳匹配的原始名字，second 为相似度（0到1之间）。
pair<string, double> find_similar_name_ignore_first(const string &input_name, const vector<string> &names) 
{
    string normalized_input = normalize_first(input_name);
    string best_match;
    double best_similarity = -numeric_limits<double>::infinity();
    for (const auto &name : names) {
        string normalized_name = normalize_first(name);
        int distance = levenshtein_distance(normalized_input, normalized_name);
        int max_len = max(normalized_input.size(), normalized_name.size());
        // 归一化相似度：1 - (编辑距离/最大长度)
        double similarity = (max_len == 0) ? 1.0 : exp(- (double)distance / max_len);
        if (similarity > best_similarity) {
            best_similarity = similarity;
            best_match = name;  // 返回原始名字
        }
    }
    return {best_match, best_similarity};
}

// int main() {
//     vector<string> names = {"Jiangcheng", "Lujinke", "Xuhaibo", "Chenbo", "Meijianhui","Jiangziben","Gaomeiyuan","Wangyadong"};
//     string input_name = "Yadong";  // 可以测试不同大小写组合
//     auto result = find_similar_name_ignore_first(input_name, names);
//     cout << "最相似的名字是: " << result.first << ", 相似度为: " << result.second << endl;
//     return 0;
// }
