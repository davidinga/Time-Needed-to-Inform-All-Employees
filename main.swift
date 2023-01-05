func numOfMinutes(_ n: Int, _ headID: Int, _ manager: [Int], _ informTime: [Int]) -> Int {
    var employees: [[Int]] = Array(repeating: [], count: n)

    for (employee, currManager) in manager.enumerated() where currManager != -1 {
        employees[currManager].append(employee)
    }

    func getNumOfMinutes(_ headID: Int) -> Int {
        var totalTime = 0
        for employee in employees[headID] {
            totalTime = max(totalTime, getNumOfMinutes(employee) + informTime[headID])
        }
        return totalTime
    }

    return getNumOfMinutes(headID)
}