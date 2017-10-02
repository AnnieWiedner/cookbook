import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Http, Response } from '@angular/http';
import { Router } from '@angular/router';


class Recipe {
  id: number;
  name: string;
  image_url: string;
  instructions: string;
  user_id: number;
}

@Component({
  selector: 'app-detail',
  templateUrl: './detail.component.html',
  styleUrls: ['./detail.component.css']
})

export class DetailComponent implements OnInit {

  recipe: Recipe = new Recipe();

  constructor(private route: ActivatedRoute, private http: Http, private router: Router){
    let id = this.route.snapshot.params.id;
    this.getRecipe(id);
  }

  ngOnInit() {
  }

  getRecipe(id){
    this.http.get('http://localhost:9393/recipes/' + id).subscribe(response =>
      this.recipe = response.json()
    )
  }

  deleteRecipe(recipe) {
    this.http.delete('http://localhost:9393/recipes/' + recipe.id).subscribe(response => {
      this.router.navigate(['/list'])
    })
  }

}
