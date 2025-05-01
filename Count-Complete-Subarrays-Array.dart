import 'package:collection/collection.dart';

// Given a list of integers and a value k, return the k least frequent elements in the list.
// Example:
// Input: nums = [1,1,1,2,2,3], k = 2
// Output: [2,3]
// Example 2:
// Input: nums = [1], k = 1
// Output: [1]

// Constraints:
// 1 <= nums.length <= 105
// k is in the range [1, the number of unique elements in the array].
// It is guaranteed that the answer is unique.
List<int> kLeastFrequent(List<int> nums, int k) {
  // I need to make a frequency map to store the frequency of each element
  // I need to make a min heap to store the k least frequent elements
  // I need to iterate through the frequency map and add the elements to the min heap
  // I need to return the elements from the min heap
  final Map<int, int> frequencyMap = {};

  // This is the less optomized way to do this without using a max heap because it's O(n log n)
  // final PriorityQueue<int> minHeap = PriorityQueue(
  //   (a, b) => frequencyMap[a]!.compareTo(frequencyMap[b]!),
  // );

  final PriorityQueue<int> maxHeap = PriorityQueue(
    (a, b) => frequencyMap[b]!.compareTo(frequencyMap[a]!),
  );

  for (int num in nums) {
    frequencyMap[num] = (frequencyMap[num] ?? 0) + 1;
  }

  for (int num in frequencyMap.keys) {
    // minHeap.add(num);
    maxHeap.add(num);
    // More optomized way to do this is to use a max heap
    // This turns it into O(n log k) instead of O(n log n).
    if (maxHeap.length > k) {
      maxHeap.removeFirst();
    }
  }

  return maxHeap.toList();

  // This is the less optomized way to do this without using a max heap
  // final List<int> result = [];
  // while (minHeap.isNotEmpty && result.length < k) {
  //   result.add(minHeap.removeFirst());
  // }
  // return result;
}

// Given an integer array nums and an integer k, return the k most frequent elements.
// You must solve it in O(n log k) time or better
// In this problem, k is the number of results you want back.
// Ex. “What are the top 3 categories a user spends the most money on?”
List<int> topKFrequent(List<int> nums, int k) {
  Map<int, int> freqMap = {};

  // Step 1: Frequency count
  for (int num in nums) {
    freqMap[num] = (freqMap[num] ?? 0) + 1;
  }

  // Step 2: Use a min-heap (PriorityQueue) to track top k
  final minHeap = PriorityQueue<int>(
    (a, b) => freqMap[a]!.compareTo(freqMap[b]!),
  );

  for (int num in freqMap.keys) {
    minHeap.add(num);
    if (minHeap.length > k) {
      minHeap.removeFirst(); // remove lowest frequency
    }
  }

  // Step 3: Return the heap contents as a list
  return minHeap.toList();
}

// "You are given an array nums consisting of positive integers.

// We call a subarray of an array complete if the following condition is satisfied:

// The number of distinct elements in the subarray is equal to the number of distinct elements in the whole array.
// Return the number of complete subarrays.

// A subarray is a contiguous non-empty part of an array.

// Example 1:

// Input: nums = [1,3,1,2,2]
// Output: 4
// Explanation: The complete subarrays are the following: [1,3,1,2], [1,3,1,2,2], [3,1,2] and [3,1,2,2].
// Example 2:

// Input: nums = [5,5,5,5]
// Output: 10
// Explanation: The array consists only of the integer 5, so any subarray is complete. The number of subarrays that we can choose is 10."

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

// Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
// You may assume that each input would have exactly one solution, and you may not use the same element twice.
// You can return the answer in any order.
//
// Example 1:
// Input: nums = [2,7,11,15], target = 9
// Output: [0,1]
// Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].
// Example 2:
//
// Input: nums = [3,2,4], target = 6
// Output: [1,2]
// Example 3:
//
// Input: nums = [3,3], target = 6
// Output: [0,1]
//
// Constraints:
// 2 <= nums.length <= 104
// -109 <= nums[i] <= 109
// -109 <= target <= 109
// Only one valid answer exists.

// Follow-up: Can you come up with an algorithm that is less than O(n2) time complexity?
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

//
// You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order, and each of their nodes contains a single digit. Add the two numbers and return the sum as a linked list.

// Input: l1 = [2,4,3], l2 = [5,6,4]
// Output: [7,0,8]
// Explanation: 342 + 465 = 807.
// Example 2:

// Input: l1 = [0], l2 = [0]
// Output: [0]
// Example 3:

// Input: l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]
// Output: [8,9,9,9,0,0,0,1]
// You may assume the two numbers do not contain any leading zero, except the number 0 itself.

// Constraints:

// The number of nodes in each linked list is in the range [1, 100].
// 0 <= Node.val <= 9
// It is guaranteed that the list represents a number that does not have leading zeros.
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
    final currentSum = l1.val + l2.val + addLeftOver;
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

// 3. Longest Substring Without Repeating Characters
// Given a string s, find the length of the longest substring without duplicate characters.
//
// Example 1:
// Input: s = "abcabcbb"
// Output: 3
// Explanation: The answer is "abc", with the length of 3.

// Example 2:
// Input: s = "bbbbb"
// Output: 1
// Explanation: The answer is "b", with the length of 1.

// Example 3:
// Input: s = "pwwkew"
// Output: 3
// Explanation: The answer is "wke", with the length of 3.
// Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.
//
// Constraints:
//
// 0 <= s.length <= 5 * 104
// s consists of English letters, digits, symbols and spaces.
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
  // lengthOfLongestSubstring('aab');
  //print(topKFrequent([1, 1, 1, 2, 2, 3], 2)); // Output: [1, 2]
  //  print(kLeastFrequent([1, 1, 1, 2, 2, 3], 2)); // Output: [2, 3]
  print(kLeastFrequent([3, 1, 2, 4, 1, 1, 2], 2)); // Output: [3, 4]
}
