import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DataAddingFormComponent } from './data-adding-form.component';

describe('DataAddingFormComponent', () => {
  let component: DataAddingFormComponent;
  let fixture: ComponentFixture<DataAddingFormComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ DataAddingFormComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(DataAddingFormComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
