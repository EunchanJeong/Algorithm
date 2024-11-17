import heapq

N = int(input())

card = []
for _ in range(N):
    num = int(input())
    heapq.heappush(card, num)

result = 0
while len(card) > 1:
    n1 = heapq.heappop(card)
    n2 = heapq.heappop(card)
    result += n1 + n2
    heapq.heappush(card, n1+n2)

print(result)