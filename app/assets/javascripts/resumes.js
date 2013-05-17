addEventListener("load", LoadWindow);
function LoadWindow () {
    var input = document.getElementById('quickSearchQuery');
    var searchInput = new InputFilter({elem: input, filtered: "#resume_search #resume_table_result .resume_table_result_left"});
    addEventListener("keyup", function () { searchInput.filter() }  );

}