String[] days = {"Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"};

int marginLeft = 70;
int marginTop = 40;
int marginRight = 20;
int marginBottom = 20;

void setup() {
  size(800,700);
  noLoop();   // static chart, only draws once
}

void draw() {
  background(255);
  drawChart();
}

void drawChart() {
  float chartW = width - marginLeft - marginRight;
  float chartH = height - marginTop - marginBottom;
  float colW = chartW / 7;    // width of one day
  float rowH = chartH / 48;   // height of one half-hour

  // horizontal grid lines + time labels (48 intervals)
  textSize(10);
  textAlign(RIGHT, CENTER);
  for (int i = 0; i < 48; i++) {
    float y = marginTop + i * rowH;

    stroke(220);
    line(marginLeft, y, width - marginRight, y);

    int hour = i / 2;
    int minute = (i % 2) * 30;
    fill(0);
    text(nf(hour, 2) + ":" + nf(minute, 2), marginLeft - 8, y);
  }

  // bottom line to close the last interval
  stroke(220);
  line(marginLeft, marginTop + chartH, width - marginRight, marginTop + chartH);

  // vertical lines + day labels
  textAlign(CENTER, BOTTOM);
  for (int d = 0; d < 7; d++) {
    float x = marginLeft + d * colW;

    stroke(220);
    line(x, marginTop, x, marginTop + chartH);

    fill(0);
    text(days[d], x + colW / 2, marginTop - 8);
  }

  // right edge
  stroke(220);
  line(width - marginRight, marginTop, width - marginRight, marginTop + chartH);

  // axes
  stroke(0);
  line(marginLeft, marginTop, marginLeft, marginTop + chartH);                      // y axis
  line(marginLeft, marginTop + chartH, width - marginRight, marginTop + chartH);    // x axis
}
