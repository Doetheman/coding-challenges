int countCompleteSubarrays(List<int> nums) {
  int uniqueValues = nums.toSet().length;
  int length = nums.length;
  int count = 0;

  for (int i = 0; i < length; i++) {
    final Map<int, int> frequencyMap = {};
    int distinct = 0;
    for (int j = i; j < length; j++) {
      int current = nums[j];
      if (!frequencyMap.containsKey(current)) {
        frequencyMap[current] = 0;
        distinct++;
      }

      frequencyMap[current] = frequencyMap[current]! + 1;
      if (distinct == uniqueValues) {
        count++;
      }
    }
  }
  return count;
  // final totalDistinct = nums.toSet().length;
  // int count = 0;

  // for (int i = 0; i < nums.length; i++) {
  //   final Map<int, int> freq = {};
  //   int distinct = 0;

  //   for (int j = i; j < nums.length; j++) {
  //     final current = nums[j];

  //     if (!freq.containsKey(current)) {
  //       freq[current] = 0;
  //       distinct++;
  //     }

  //     freq[current] = freq[current]! + 1;

  //     if (distinct == totalDistinct) {
  //       count++;
  //     }

  //     // Print subarray and frequency map at each step
  //     print("Subarray: ${nums.sublist(i, j + 1)}");
  //     print("Freq: $freq");
  //     print("Distinct: $distinct\n");
  //   }
  // }

  // print("Total complete subarrays: $count");
  // return count;
}

List<int> twoSum(List<int> nums, int target) {
  final Map<int, int> seen = {}; // Map of num → index

  for (int i = 0; i < nums.length; i++) {
    int complement = target - nums[i];
    if (seen.containsKey(complement)) {
      return [seen[complement]!, i];
    }
    seen[nums[i]] = i;
  }

  return [];
}

class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

List<int>? addTwoNumbers(ListNode? l1, ListNode? l2) {
  List<int> combinedList = [];
  int addLeftOver = 0;

  while (l1 != null || l2 != null) {
    if (l1 == null) {
      l1 = ListNode(0);
    }
    if (l2 == null) {
      l2 = ListNode(0);
    }
    final currentSum = l1!.val + l2!.val + addLeftOver;
    final leftOver = currentSum % 1;
    if (leftOver > 0 || currentSum > 9) {
      if (leftOver == 0) {
        combinedList.add(0);
        addLeftOver = 1;
      } else {
        combinedList.add(currentSum - leftOver);
      }
    } else {
      combinedList.add(currentSum);
    }
    l1 = l1.next;
    l2 = l2.next;
  }
  print(combinedList);
  return combinedList;
}

int lengthOfLongestSubstring(String s) {
  int left = 0;
  int right = 0;
  int maxLength = 0;
  final Set<String> seen = {};

  while (right < s.length) {
    String currentChar = s[right];

    if (!seen.contains(currentChar)) {
      seen.add(currentChar);
      maxLength = maxLength > seen.length ? maxLength : seen.length;
      right++;
    } else {
      seen.remove(s[left]);
      left++;
    }
  }

  return maxLength;
}


void main() {
  // final nums = [1, 3, 1, 2, 2];
  // countCompleteSubarrays(nums);
  //twoSum(nums, 4);
  // addTwoNumbers(
  //   ListNode(2, ListNode(4, ListNode(3))),
  //   ListNode(5, ListNode(6, ListNode(4))),
  // );
  //Input: l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]
  // addTwoNumbers(
  //   ListNode(
  //     9,
  //     ListNode(
  //       9,
  //       ListNode(
  //         9,
  //         ListNode(
  //           9,
  //           ListNode(9, ListNode(9, ListNode(9, ListNode(9, ListNode(9))))),
  //         ),
  //       ),
  //     ),
  //   ),
  //   ListNode(9, ListNode(9, ListNode(9, ListNode(9)))),
  // );
  lengthOfLongestSubstring('aab');
}
