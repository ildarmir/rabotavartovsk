addEventListener("load", LoadWindow);
function LoadWindow () {
      $('.carousel').carousel({interval: 8000});
    var input = document.getElementById('quickSearchQuery');
    var searchInput = new InputFilter({elem: input, filtered: "#vacancy_search #vacancy_table_result .vacancy_table_result_left"});
    addEventListener("keyup", function () { searchInput.filter() }  );

}
