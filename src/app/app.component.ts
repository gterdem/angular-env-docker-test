import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { environment } from 'src/environments/environment';
import { AppSettingsJsonDto } from 'src/environments/AppSetting';




@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent implements OnInit {

  title = 'angular-env-docker-test';
  isProdMode = environment.production;
  apiUrl = '';
  appUrl = '';
  constructor(private httpClient: HttpClient) { }
  ngOnInit(): void {
    const appSettingsUrl = window.location.origin + '/assets/' + environment.appConfig;
    this.httpClient.get<AppSettingsJsonDto>(appSettingsUrl).subscribe(result => {
      this.appUrl = result.appBaseUrl;
      this.apiUrl = result.remoteServiceBaseUrl;
    });

  }
}
