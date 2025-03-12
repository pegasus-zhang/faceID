#pragma once
#include <iostream>
#include <vector>
#include <string>
#include <algorithm>
#include <cctype>
#include <limits>
#include <math.h>

std::pair<std::string, double> find_similar_name_ignore_first(const std::string &input_name, const std::vector<std::string> &names);