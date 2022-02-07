import { ComponentFixture, TestBed } from '@angular/core/testing';

import { UserBasketComponent } from './user-basket.component';

describe('UserBasketComponent', () => {
  let component: UserBasketComponent;
  let fixture: ComponentFixture<UserBasketComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ UserBasketComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(UserBasketComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
