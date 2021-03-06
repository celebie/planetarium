// Gravitational Attraction (3D) 
// Daniel Shiffman <http://www.shiffman.net>

// A class for an attractive body in our world

class Sun {
  float mass;         // Mass, tied to size
  PVector location;   // Location
  float G;            // Universal gravitational constant (arbitrary value)
  PShape sphere;

  Sun() {
    location = new PVector(0,0);
    mass = 20;
    G = 0.4;
    sphere = createShape(SPHERE, mass*2);
    sphere.setFill(false);
    sphere.setStroke(color(255));
  }


  PVector attract(Planet m) {
    PVector force = PVector.sub(location,m.location);    // Calculate direction of force
    float d = force.mag();                               // Distance between objects
    d = constrain(d,5.0,25.0);                           // Limiting the distance to eliminate "extreme" results for very close or very far objects
    float strength = (G * mass * m.mass) / (d * d);      // Calculate gravitional force magnitude
    force.setMag(strength);                              // Get force vector --> magnitude * direction
    return force;
  }

  // Draw Sun
  void display() {       
    pushMatrix();
    translate(location.x,location.y,location.z);
    shape(sphere);
    popMatrix();
  }
}
