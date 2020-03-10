(set-info :smt-lib-version 2.6)
(set-logic AUFBVFPDTNIRA)
(set-info :source |
Generated by: AdaCore
Generated on: 2020-03-06
Generator: SPARK
Application: Program verification for Ada
Target solver: CVC4
|)
(set-info :license "https://creativecommons.org/licenses/by/4.0/")
(set-info :category "industrial")
(set-info :status unknown)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(declare-sort string 0)

(declare-datatypes ((tuple0 0))
(((Tuple0))))
(declare-sort us_private 0)

(declare-fun private__bool_eq (us_private us_private) Bool)

(declare-const us_null_ext__ us_private)

(declare-sort us_type_of_heap 0)

(declare-datatypes ((us_type_of_heap__ref 0))
(((us_type_of_heap__refqtmk (us_type_of_heap__content us_type_of_heap)))))
(declare-sort us_image 0)

(declare-datatypes ((int__ref 0))
(((int__refqtmk (int__content Int)))))
(declare-datatypes ((bool__ref 0))
(((bool__refqtmk (bool__content Bool)))))
(declare-datatypes ((us_fixed__ref 0))
(((us_fixed__refqtmk (us_fixed__content Int)))))
(declare-datatypes ((real__ref 0))
(((real__refqtmk (real__content Real)))))
(declare-datatypes ((us_private__ref 0))
(((us_private__refqtmk (us_private__content us_private)))))
(define-fun int__ref___projection ((a int__ref)) Int (int__content a))

(define-fun us_fixed__ref___projection ((a us_fixed__ref)) Int (us_fixed__content
                                                               a))

(define-fun bool__ref___projection ((a bool__ref)) Bool (bool__content a))

(define-fun real__ref___projection ((a real__ref)) Real (real__content a))

(define-fun us_private__ref___projection ((a us_private__ref)) us_private 
  (us_private__content a))

(define-fun abs1 ((x Int)) Int (ite (<= 0 x) x (- x)))

;; Abs_le
  (assert
  (forall ((x Int) (y Int)) (= (<= (abs1 x) y) (and (<= (- y) x) (<= x y)))))

;; Abs_pos
  (assert (forall ((x Int)) (<= 0 (abs1 x))))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-sort coordinate_type 0)

(declare-fun coordinate_typeqtint (coordinate_type) Int)

;; coordinate_type'axiom
  (assert
  (forall ((i coordinate_type))
  (and (<= 1 (coordinate_typeqtint i)) (<= (coordinate_typeqtint i) 100))))

(define-fun in_range ((x Int)) Bool (and (<= 1 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (coordinate_type coordinate_type) Bool)

(declare-const dummy coordinate_type)

(declare-datatypes ((coordinate_type__ref 0))
(((coordinate_type__refqtmk (coordinate_type__content coordinate_type)))))
(define-fun coordinate_type__ref_coordinate_type__content__projection ((a coordinate_type__ref)) coordinate_type 
  (coordinate_type__content a))

(define-fun to_rep ((x coordinate_type)) Int (coordinate_typeqtint x))

(declare-fun of_rep (Int) coordinate_type)

;; inversion_axiom
  (assert
  (forall ((x coordinate_type))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x coordinate_type)) (! (in_range
  (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                           (of_rep x))) )))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__raster_graphics__point__x coordinate_type)(rec__raster_graphics__point__y coordinate_type)))))
(define-fun us_split_fields_rec__raster_graphics__point__x__projection ((a us_split_fields)) coordinate_type 
  (rec__raster_graphics__point__x a))

(define-fun us_split_fields_rec__raster_graphics__point__y__projection ((a us_split_fields)) coordinate_type 
  (rec__raster_graphics__point__y a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (to_rep
                           (rec__raster_graphics__point__x
                           (us_split_fields1 a))) (to_rep
                                                  (rec__raster_graphics__point__x
                                                  (us_split_fields1 b))))
                        (= (to_rep
                           (rec__raster_graphics__point__y
                           (us_split_fields1 a))) (to_rep
                                                  (rec__raster_graphics__point__y
                                                  (us_split_fields1 b)))))
                   true false))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const raster_graphics__point__x__first__bit Int)

(declare-const raster_graphics__point__x__last__bit Int)

(declare-const raster_graphics__point__x__position Int)

;; raster_graphics__point__x__first__bit_axiom
  (assert (<= 0 raster_graphics__point__x__first__bit))

;; raster_graphics__point__x__last__bit_axiom
  (assert
  (< raster_graphics__point__x__first__bit raster_graphics__point__x__last__bit))

;; raster_graphics__point__x__position_axiom
  (assert (<= 0 raster_graphics__point__x__position))

(declare-const raster_graphics__point__y__first__bit Int)

(declare-const raster_graphics__point__y__last__bit Int)

(declare-const raster_graphics__point__y__position Int)

;; raster_graphics__point__y__first__bit_axiom
  (assert (<= 0 raster_graphics__point__y__first__bit))

;; raster_graphics__point__y__last__bit_axiom
  (assert
  (< raster_graphics__point__y__first__bit raster_graphics__point__y__last__bit))

;; raster_graphics__point__y__position_axiom
  (assert (<= 0 raster_graphics__point__y__position))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-const dummy1 us_rep)

(declare-datatypes ((point__ref 0))
(((point__refqtmk (point__content us_rep)))))
(define-fun point__ref_point__content__projection ((a point__ref)) us_rep 
  (point__content a))

(declare-const a us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const b us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const min Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const min_distance Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-const attr__ATTRIBUTE_ADDRESS6 Int)

(declare-sort tcoordinate_typeB 0)

(declare-fun tcoordinate_typeBqtint (tcoordinate_typeB) Int)

;; tcoordinate_typeB'axiom
  (assert
  (forall ((i tcoordinate_typeB))
  (and (<= (- 2147483648) (tcoordinate_typeBqtint i))
  (<= (tcoordinate_typeBqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq2 (tcoordinate_typeB tcoordinate_typeB) Bool)

(declare-const dummy2 tcoordinate_typeB)

(declare-datatypes ((tcoordinate_typeB__ref 0))
(((tcoordinate_typeB__refqtmk (tcoordinate_typeB__content tcoordinate_typeB)))))
(define-fun tcoordinate_typeB__ref_tcoordinate_typeB__content__projection ((a1 tcoordinate_typeB__ref)) tcoordinate_typeB 
  (tcoordinate_typeB__content a1))

(define-fun dynamic_invariant ((temp___expr_158 Int)
  (temp___is_init_154 Bool) (temp___skip_constant_155 Bool)
  (temp___do_toplevel_156 Bool)
  (temp___do_typ_inv_157 Bool)) Bool (=>
                                     (or (= temp___is_init_154 true)
                                     (<= 1 100)) (in_range temp___expr_158)))

(declare-sort status_type 0)

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 2)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq3 (status_type status_type) Bool)

(declare-const dummy3 status_type)

(declare-datatypes ((status_type__ref 0))
(((status_type__refqtmk (status_type__content status_type)))))
(define-fun status_type__ref_status_type__content__projection ((a1 status_type__ref)) status_type 
  (status_type__content a1))

(define-fun dynamic_invariant1 ((temp___expr_181 Int)
  (temp___is_init_177 Bool) (temp___skip_constant_178 Bool)
  (temp___do_toplevel_179 Bool)
  (temp___do_typ_inv_180 Bool)) Bool (=>
                                     (or (= temp___is_init_177 true)
                                     (<= 0 2)) (in_range2 temp___expr_181)))

;; min_distance__def_axiom
  (assert (= min_distance min))

(assert
;; defqtvc
 ;; File "raster_graphics.adb", line 9, characters 0-0
  (not
  (forall ((status Int) (o Int) (o1 Int))
  (=> (dynamic_invariant min true false true true)
  (=> (dynamic_invariant min true false true true)
  (=> (dynamic_invariant min_distance true false true true)
  (=> (= min min_distance)
  (=> (dynamic_invariant1 status false false true true)
  (=> (= (to_rep (rec__raster_graphics__point__x (us_split_fields1 b))) o)
  (=> (= (to_rep (rec__raster_graphics__point__x (us_split_fields1 a))) o1)
  (let ((o2 (abs1 (- o1 o))))
  (=> (in_range1 o2)
  (=> (in_range o2)
  (forall ((delta_x Int))
  (=> (= delta_x o2)
  (=> (dynamic_invariant delta_x true false true true)
  (forall ((o3 Int))
  (=> (= (to_rep (rec__raster_graphics__point__y (us_split_fields1 b))) o3)
  (forall ((o4 Int))
  (=> (= (to_rep (rec__raster_graphics__point__y (us_split_fields1 a))) o4)
  (let ((o5 (abs1 (- o4 o3))))
  (=> (in_range1 o5)
  (=> (in_range o5)
  (forall ((delta_y Int))
  (=> (= delta_y o5)
  (=> (dynamic_invariant delta_y true false true true)
  (=> (in_range1 (* min_distance min_distance)) (in_range1
  (* delta_y delta_y)))))))))))))))))))))))))))))
(check-sat)
(exit)
