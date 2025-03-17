let numberArray = [];

function addCustomValues() {
    const inputValue = document.getElementById("customValue").value;

    if (inputValue.trim() === "") {
        alert("Please enter some numbers.");
        return;
    }

    const values = inputValue.split(',')
                             .map(item => parseFloat(item.trim()))
                             .filter(item => !isNaN(item));

    if (values.length === 0) {
        alert("Please enter valid numbers.");
        return;
    }

    numberArray = numberArray.concat(values);
    updateDisplayAndResult('Add Numbers', 'Adds the numbers to the array', numberArray);
    document.getElementById("customValue").value = '';
}

function pushValue() {
    const value = prompt("Enter a number to push:");
    if (!isNaN(value) && value !== null && value !== "") {
        numberArray.push(parseFloat(value));
        updateDisplayAndResult('Push', 'Adds a new element at the end of the array', numberArray);
    }
}

function popValue() {
    if (numberArray.length === 0) {
        alert("Array is empty.");
        return;
    }
    numberArray.pop();
    updateDisplayAndResult('Pop', 'Removes the last element of the array', numberArray);
}

function shiftValue() {
    if (numberArray.length === 0) {
        alert("Array is empty.");
        return;
    }
    numberArray.shift();
    updateDisplayAndResult('Shift', 'Removes the first element of the array', numberArray);
}

function unshiftValue() {
    const value = prompt("Enter a number to unshift:");
    if (!isNaN(value) && value !== null && value !== "") {
        numberArray.unshift(parseFloat(value));
        updateDisplayAndResult('Unshift', 'Adds a new element at the start of the array', numberArray);
    }
}

function spliceValue() {
    const index = parseInt(prompt("Enter the index to start splicing:"));
    const count = parseInt(prompt("How many items to remove?"));
    const value = prompt("Enter value(s) to insert separated by commas (e.g., 4, 5):");
    const values = value.split(',').map(item => parseFloat(item.trim()));

    numberArray.splice(index, count, ...values);
    updateDisplayAndResult('Splice', 'Changes the contents of the array by removing or replacing elements', numberArray);
}

function sliceValues() {
    const start = parseInt(prompt("Enter the start index:"));
    const end = parseInt(prompt("Enter the end index:"));
    const sliced = numberArray.slice(start, end);
    updateDisplayAndResult('Slice', 'Returns a shallow copy of a portion of the array', sliced);
}

function reduceValues() {
    const sum = numberArray.reduce((acc, curr) => acc + curr, 0);
    updateDisplayAndResult('Reduce', 'Applies a function against an accumulator and each element', sum);
}

function reverseValues() {
    numberArray.reverse();
    updateDisplayAndResult('Reverse', 'Reverses the elements of the array', numberArray);
}

function updateDisplayAndResult(operation, definition, result) {
    document.getElementById("arrayDisplay").textContent = JSON.stringify(result);
    document.getElementById("operationResult").innerHTML = `
        <strong>${operation}</strong>: ${definition}<br>
        <strong>Updated Array:</strong> ${JSON.stringify(result)}
    `;
}
