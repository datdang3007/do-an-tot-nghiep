// #Config
const speed = 30; // ms
const gamePlayTime = 20;

// Get the modal
var modal = document.getElementById("myModal");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

playing = false;

closeMiniGame = function (bool) {
  setTimeout(function () {
    $("#main-minigame").fadeOut();
    setTimeout(function () {
      $.post(
        `https://${GetParentResourceName()}/maze-callback`,
        JSON.stringify({ success: bool })
      );
    }, 500);
  }, 1500);
};

// When the user clicks the button, open the modal
modelfungo = function () {
  modal.style.display = "block";
  // x = document.querySelector(".gamehead");
  // x.textContent = "Game Over";
  closeMiniGame(false);
};

modelfunwin = function () {
  modal.style.display = "block";
  // x = document.querySelector(".gamehead");
  // x.textContent = "Congrats! You Win";
  closeMiniGame(true);
};

function myFunction() {
  document.location.reload();
}

function startTimer(duration, display) {
  var start = Date.now(),
    diff,
    minutes,
    seconds;

  function timer() {
    if (playing) {
      diff = duration - (((Date.now() - start) / 1000) | 0);
      minutes = (diff / 60) | 0;
      seconds = diff % 60 | 0;
      minutes = minutes < 10 ? "0" + minutes : minutes;
      seconds = seconds < 10 ? "0" + seconds : seconds;
      display.textContent = "Game ends in " + minutes + ":" + seconds;

      if (diff <= 0) {
        display.textContent = "Game Over";
        start = Date.now() + 1000;
        playing = false;
        modelfungo();
      }
    }
  }
  timer();
  setInterval(timer, 1000);
}

window.addEventListener("keydown", doKeyDown, true);

function doKeyDown(evt) {
  var handled = false;
  if (playing) {
    switch (evt.keyCode) {
      case 38 /* Up arrow was pressed */:
        m.moveup("canvas");
        handled = true;
        break;
      case 87 /* Up arrow was pressed */:
        m.moveup("canvas");
        handled = true;
        break;
      case 40 /* Down arrow was pressed */:
        m.movedown("canvas");
        handled = true;
        break;
      case 83 /* Down arrow was pressed */:
        m.movedown("canvas");
        handled = true;
        break;
      case 37 /* Left arrow was pressed */:
        m.moveleft("canvas");
        handled = true;
        break;
      case 65 /* Left arrow was pressed */:
        m.moveleft("canvas");
        handled = true;
        break;
      case 39 /* Right arrow was pressed */:
        m.moveright("canvas");
        handled = true;
        break;
      case 68 /* Right arrow was pressed */:
        m.moveright("canvas");
        handled = true;
        break;
    }
    if (m.checker("canvas")) playing = false;
  }
  if (handled) evt.preventDefault(); // prevent arrow keys from scrolling the page (supported in IE9+ and all other browsers)
}

var dsd = function (size) {
  this.N = size;
  this.P = new Array(this.N);
  this.R = new Array(this.N);

  this.init = function () {
    for (var i = 0; i < this.N; i++) {
      this.P[i] = i;
      this.R[i] = 0;
    }
  };

  this.union = function (x, y) {
    var u = this.find(x);
    var v = this.find(y);
    if (this.R[u] > this.R[v]) {
      this.R[u] = this.R[v] + 1;
      this.P[u] = v;
    } else {
      this.R[v] = this.R[u] + 1;
      this.P[v] = u;
    }
  };

  this.find = function (x) {
    if (x == this.P[x]) return x;
    this.P[x] = this.find(this.P[x]);
    return this.P[x];
  };
};

function random(min, max) {
  return min + Math.random() * (max - min);
}
function randomChoice(choices) {
  return choices[Math.round(random(0, choices.length - 1))];
}

var maze = function (X, Y) {
  this.N = X;
  this.M = Y;
  this.S = 25;
  this.moves = 0;
  this.Board = new Array(2 * this.N + 1);
  this.EL = new Array();
  this.vis = new Array(2 * this.N + 1);
  this.delay = 2;
  this.x = 1;
  this.start = null;
  this.init = function () {
    for (var i = 0; i < 2 * this.N + 1; i++) {
      this.Board[i] = new Array(2 * this.M + 1);
      this.vis[i] = new Array(2 * this.M + 1);
    }

    for (var i = 0; i < 2 * this.N + 1; i++) {
      for (var j = 0; j < 2 * this.M + 1; j++) {
        if (!(i % 2) && !(j % 2)) {
          this.Board[i][j] = "+";
        } else if (!(i % 2)) {
          this.Board[i][j] = "-";
        } else if (!(j % 2)) {
          this.Board[i][j] = "|";
        } else {
          this.Board[i][j] = " ";
        }
        this.vis[i][j] = 0;
      }
    }
  };

  this.add_edges = function () {
    for (var i = 0; i < this.N; i++) {
      for (var j = 0; j < this.M; j++) {
        if (i != this.N - 1) {
          this.EL.push([[i, j], [i + 1, j], 1]);
        }
        if (j != this.M - 1) {
          this.EL.push([[i, j], [i, j + 1], 1]);
        }
      }
    }
  };

  //Hash function
  this.h = function (e) {
    return e[1] * this.M + e[0];
  };
  this.randomize = function (EL) {
    for (var i = 0; i < EL.length; i++) {
      var si = Math.floor(Math.random() * 387) % EL.length;
      var tmp = EL[si];
      EL[si] = EL[i];
      EL[i] = tmp;
    }
    return EL;
  };

  this.breakwall = function (e) {
    var x = e[0][0] + e[1][0] + 1;
    var y = e[0][1] + e[1][1] + 1;
    this.Board[x][y] = " ";
  };

  this.gen_maze = function () {
    this.EL = this.randomize(this.EL);
    var D = new dsd(this.M * this.M);
    D.init();
    var s = this.h([0, 0]);
    var e = this.h([this.N - 1, this.M - 1]);
    this.Board[1][0] = " ";
    this.Board[2 * this.N - 1][2 * this.M] = " ";
    //Run Kruskal
    for (var i = 0; i < this.EL.length; i++) {
      var x = this.h(this.EL[i][0]);
      var y = this.h(this.EL[i][1]);
      if (D.find(s) == D.find(e)) {
        if (!(D.find(x) == D.find(s) && D.find(y) == D.find(s))) {
          if (D.find(x) != D.find(y)) {
            D.union(x, y);
            this.breakwall(this.EL[i]);
            this.EL[i][2] = 0;
          }
        }
        //break;
      } else if (D.find(x) != D.find(y)) {
        D.union(x, y);
        this.breakwall(this.EL[i]);
        this.EL[i][2] = 0;
      } else {
        continue;
      }
    }
  };

  this.draw_canvas = function () {
    $("#canvas-container").html(`
      <canvas id="canvas" width="523" height="523">
        This text is displayed if your browser does not support HTML5
        Canvas.
      </canvas>
    `);
    this.canvas = document.getElementById("canvas");
    var scale = this.S;
    temp = [];
    if (this.canvas.getContext) {
      this.ctx = this.canvas.getContext("2d");
      this.Board[1][0] = "$";
      for (var i = 0; i < 2 * this.N + 1; i++) {
        for (var j = 0; j < 2 * this.M + 1; j++) {
          if (this.Board[i][j] != " ") {
            //} && this.Board[i][j] != '&') {
            this.ctx.fillStyle = "#0b052d";
            this.ctx.fillRect(scale * i, scale * j, scale, scale);
          } else if (i < 5 && j < 5) temp.push([i, j]);
        }
      }
      x = randomChoice(temp);
      this.start = x;
      this.Board[x[0]][x[1]] = "&";
      this.ctx.fillStyle = "#c4192a";
      this.ctx.fillRect(scale * x[0], scale * x[1], scale, scale);
    }
  };

  this.checkPos = function () {
    for (var i = 0; i < 2 * this.N + 1; i++) {
      for (var j = 0; j < 2 * this.M + 1; j++) {
        if (this.Board[i][j] == "&") {
          return [i, j];
        }
      }
    }
  };

  this.moveclear = function (a, b) {
    var scale = this.S;
    this.ctx = this.canvas.getContext("2d");
    this.ctx.fillStyle = "#e27158";
    this.ctx.fillRect(scale * a, scale * b, scale, scale);
    this.Board[a][b] = " ";
  };

  this.move = function (a, b) {
    var scale = this.S;
    this.ctx = this.canvas.getContext("2d");
    this.ctx.fillStyle = "#c4192a";
    this.ctx.fillRect(scale * a, scale * b, scale, scale);
    this.Board[a][b] = "&";
  };

  this.moveup = function (id) {
    cord = this.checkPos(id);
    var scale = this.S;
    i = cord[0];
    j = cord[1];
    j -= 1;
    if (j < 0) return;
    else if (j > 2 * this.M) return;
    else if (this.Board[i][j] == " ") {
      this.moveclear(i, j + 1);
      this.move(i, j);
      this.moves += 1;
    } else return;
  };

  this.movedown = function (id) {
    cord = this.checkPos(id);
    var scale = this.S;
    i = cord[0];
    j = cord[1];
    j += 1;
    if (j < 0) return;
    else if (j > 2 * this.M) return;
    else if (this.Board[i][j] == " ") {
      this.moveclear(i, j - 1);
      this.move(i, j);
      this.moves += 1;
    } else return;
  };

  this.moveleft = function (id) {
    cord = this.checkPos(id);
    var scale = this.S;
    i = cord[0];
    j = cord[1];
    i -= 1;
    if (i < 0) return;
    else if (i > 2 * this.N) return;
    else if (this.Board[i][j] == " ") {
      this.moveclear(i + 1, j);
      this.move(i, j);
      this.moves += 1;
    } else return;
  };

  this.moveright = function (id) {
    cord = this.checkPos(id);
    var scale = this.S;
    i = cord[0];
    j = cord[1];
    i += 1;
    if (i < 0) return;
    else if (i > 2 * this.N) return;
    else if (this.Board[i][j] == " ") {
      this.moveclear(i - 1, j);
      this.move(i, j);
      this.moves += 1;
    } else return;
  };

  this.checker = function (id) {
    cord = this.checkPos(id);
    i = cord[0];
    j = cord[1];
    if ((i == 19 && j == 20) || (i == 1 && j == 0)) {
      // Win game:
      modelfunwin();
      return 1;
    }
    return 0;
  };

  this.aSearchMove = function () {
    solveMazeAndMove();
  };

  this.getMoves = function () {
    return this.moves;
  };
};

// --------------------------------
// --- A* Algorithm Implementation
// --------------------------------

class Node {
  constructor(parent, position) {
    this.parent = parent;
    this.position = position;
    this.g = 0;
    this.h = 0;
    this.f = 0;
  }
}

function aStar(maze, start, end) {
  let startNode = new Node(null, start);
  let endNode = new Node(null, end);
  let openList = [];
  let closedList = [];
  openList.push(startNode);

  while (openList.length > 0) {
    let currentNode = openList.reduce((a, b) => (a.f < b.f ? a : b));
    openList = openList.filter((node) => node !== currentNode);
    closedList.push(currentNode);

    if (
      currentNode.position[0] === endNode.position[0] &&
      currentNode.position[1] === endNode.position[1]
    ) {
      let path = [];
      let current = currentNode;
      while (current) {
        path.push(current.position);
        current = current.parent;
      }
      return path.reverse();
    }

    let children = [];
    let positions = [
      [0, -1], // Up
      [0, 1], // Down
      [-1, 0], // Left
      [1, 0], // Right
    ];

    for (let pos of positions) {
      let nodePosition = [
        currentNode.position[0] + pos[0],
        currentNode.position[1] + pos[1],
      ];

      if (
        nodePosition[0] < 0 ||
        nodePosition[0] >= maze.length ||
        nodePosition[1] < 0 ||
        nodePosition[1] >= maze[0].length
      ) {
        continue;
      }

      if (maze[nodePosition[0]][nodePosition[1]] !== " ") {
        continue;
      }

      let newNode = new Node(currentNode, nodePosition);
      children.push(newNode);
    }

    for (let child of children) {
      if (
        closedList.find(
          (node) =>
            node.position[0] === child.position[0] &&
            node.position[1] === child.position[1]
        )
      ) {
        continue;
      }

      child.g = currentNode.g + 1;
      child.h =
        (child.position[0] - endNode.position[0]) ** 2 +
        (child.position[1] - endNode.position[1]) ** 2;
      child.f = child.g + child.h;

      if (
        openList.find(
          (node) =>
            node.position[0] === child.position[0] &&
            node.position[1] === child.position[1] &&
            child.g > node.g
        )
      ) {
        continue;
      }

      openList.push(child);
    }
  }

  return []; // No path found
}

function solveMazeAndMove() {
  let start = m.start; // Start position
  let end = [19, 20]; // End position

  // Convert the maze to a 2D array of characters
  let mazeArray = [];
  for (let i = 0; i < 2 * m.N + 1; i++) {
    let row = [];
    for (let j = 0; j < 2 * m.M + 1; j++) {
      row.push(m.Board[i][j]);
    }
    mazeArray.push(row);
  }

  let path = aStar(mazeArray, start, end);

  if (path.length === 0) {
    console.log("No path found!");
  } else {
    // Function to move the entity along the path
    function moveEntity(path, index) {
      if (index >= path.length) {
        modelfunwin();
        playing = false;
        return;
      }
      let pos = path[index];
      let scale = m.S;
      m.moveclear(path[index - 1][0], path[index - 1][1]); // Clear previous position
      m.ctx.fillStyle = "#c4192a"; // Entity color
      m.ctx.fillRect(scale * pos[0], scale * pos[1], scale, scale);
      m.Board[pos[0]][pos[1]] = "&"; // Mark new position
      setTimeout(() => moveEntity(path, index + 1), speed); // Move to next position
    }

    moveEntity(path, 1); // Start moving from the second position
  }
}

m = new maze(10, 10);

function resetGame() {
  // Reset maze object and canvas
  m = new maze(10, 10);
  m.init();
  m.add_edges();
  m.gen_maze();
  m.draw_canvas("canvas");

  // Reset modal and game state
  modal.style.display = "none";
  playing = true;
}

window.addEventListener("message", (event) => {
  if (event.data.action === "maze-start") {
    resetGame();
    $("#main-minigame").fadeIn();

    newGamePlayTime = gamePlayTime;
    x = document.querySelector("#timerel");
    x.textContent = "Game ends in 00:" + gamePlayTime;

    if (event.data.auto) {
      m.aSearchMove();
    }

    startTimer(newGamePlayTime, x);
  }
});
