
const partyHeader = document.getElementById('party');

export const htmlGenerator = (string, htmlElement) => {
    let ele = document.createElement("p");
    let text = document.createTextNode(string);
    ele.appendChild(text);
    htmlElement.appendChild(ele);
};

htmlGenerator('Party Time.', partyHeader);

