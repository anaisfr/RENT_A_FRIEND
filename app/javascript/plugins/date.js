const calendarDate = () => {
  if (document.getElementById("booking_start_date")) {
  const date1 = document.getElementById("booking_start_date");
  const date2 = document.getElementById("booking_end_date");


  date2.addEventListener("change", (event) => {
  if (date1.value) {

    const startDate = new Date(date1.value);
    const endDate = new Date(date2.value);


    const dateDiff = endDate - startDate;

    const dayDiff = dateDiff / 86400000;

    const price = document.getElementById('price').innerText;

    const total = document.querySelector('.total');

    total.innerText = `${dayDiff * price}€`;

    }
  });
  }
};


export { calendarDate };
