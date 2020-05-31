class Clock {
  constructor() {
    // 1. Create a Date object.
    // 2. Store the hours, minutes, and seconds.
    // 3. Call printTime.
    // 4. Schedule the tick at 1 second intervals.
    let date = new Date();
    this.hours = date.getHours();
    this.minutes = date.getMinutes();
    this.seconds = date.getSeconds();

    this.printTime();
    setInterval(this._tick.bind(this), 1000);
  }

  printTime() {
    // Format the time in HH:MM:SS
    // Use console.log to print it.
    console.log(`${this.hours}:${this.minutes}:${this.seconds}`);
  }

  _tick() {
    // 1. Increment the time by one second.
    // 2. Call printTime.
    let hoursInSeconds = this.hours * 60 * 60;
    let minutesInSeconds = this.minutes * 60;
    let time = hoursInSeconds + minutesInSeconds + this.seconds;
    time++;

    this.seconds = time % 60;
    time = Math.floor(time / 60);
    this.minutes = time % 60;
    time = Math.floor(time / 60);
    this.hours = time % 24;

    this.printTime();
  }
}

const clock = new Clock();
