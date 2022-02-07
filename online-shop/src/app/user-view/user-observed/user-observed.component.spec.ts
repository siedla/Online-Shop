import { ComponentFixture, TestBed } from '@angular/core/testing';

import { UserObservedComponent } from './user-observed.component';

describe('UserObservedComponent', () => {
  let component: UserObservedComponent;
  let fixture: ComponentFixture<UserObservedComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ UserObservedComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(UserObservedComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
