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

(define-fun in_range ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Bool)

(declare-sort path 0)

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 3)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (path path) Bool)

(declare-const dummy path)

(declare-datatypes ((path__ref 0))
(((path__refqtmk (path__content path)))))
(define-fun path__ref_path__content__projection ((a path__ref)) path 
  (path__content a))

(declare-fun to_rep (path) Int)

(declare-fun of_rep (Int) path)

;; inversion_axiom
  (assert
  (forall ((x path)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x path)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__road_traffic__conflict__left path)(rec__road_traffic__conflict__right path)))))
(define-fun us_split_fields_rec__road_traffic__conflict__left__projection ((a us_split_fields)) path 
  (rec__road_traffic__conflict__left a))

(define-fun us_split_fields_rec__road_traffic__conflict__right__projection ((a us_split_fields)) path 
  (rec__road_traffic__conflict__right a))

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
                           (rec__road_traffic__conflict__left
                           (us_split_fields1 a))) (to_rep
                                                  (rec__road_traffic__conflict__left
                                                  (us_split_fields1 b))))
                        (= (to_rep
                           (rec__road_traffic__conflict__right
                           (us_split_fields1 a))) (to_rep
                                                  (rec__road_traffic__conflict__right
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

(declare-const road_traffic__conflict__left__first__bit Int)

(declare-const road_traffic__conflict__left__last__bit Int)

(declare-const road_traffic__conflict__left__position Int)

;; road_traffic__conflict__left__first__bit_axiom
  (assert (<= 0 road_traffic__conflict__left__first__bit))

;; road_traffic__conflict__left__last__bit_axiom
  (assert
  (< road_traffic__conflict__left__first__bit road_traffic__conflict__left__last__bit))

;; road_traffic__conflict__left__position_axiom
  (assert (<= 0 road_traffic__conflict__left__position))

(declare-const road_traffic__conflict__right__first__bit Int)

(declare-const road_traffic__conflict__right__last__bit Int)

(declare-const road_traffic__conflict__right__position Int)

;; road_traffic__conflict__right__first__bit_axiom
  (assert (<= 0 road_traffic__conflict__right__first__bit))

;; road_traffic__conflict__right__last__bit_axiom
  (assert
  (< road_traffic__conflict__right__first__bit road_traffic__conflict__right__last__bit))

;; road_traffic__conflict__right__position_axiom
  (assert (<= 0 road_traffic__conflict__right__position))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-const dummy1 us_rep)

(declare-datatypes ((conflict__ref 0))
(((conflict__refqtmk (conflict__content us_rep)))))
(define-fun conflict__ref_conflict__content__projection ((a conflict__ref)) us_rep 
  (conflict__content a))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int us_rep))))))
(declare-fun slide ((Array Int us_rep) Int Int) (Array Int us_rep))

;; slide_eq
  (assert
  (forall ((a (Array Int us_rep)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int us_rep)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq1 ((a (Array Int us_rep)) (a__first Int) (a__last Int)
  (b (Array Int us_rep)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_159 Int))
                           (=>
                           (and (<= a__first temp___idx_159)
                           (<= temp___idx_159 a__last))
                           (= (bool_eq (select a temp___idx_159)
                              (select b (+ (- b__first a__first) temp___idx_159))) true))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int us_rep)) (b (Array Int us_rep)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq1 b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_159 Int))
  (=> (and (<= a__first temp___idx_159) (<= temp___idx_159 a__last))
  (= (bool_eq (select a temp___idx_159)
     (select b (+ (- b__first a__first) temp___idx_159))) true))))))))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-sort light 0)

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 2)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq2 (light light) Bool)

(declare-const dummy2 light)

(declare-datatypes ((light__ref 0))
(((light__refqtmk (light__content light)))))
(define-fun light__ref_light__content__projection ((a light__ref)) light 
  (light__content a))

(declare-fun to_rep1 (light) Int)

(declare-fun of_rep1 (Int) light)

;; inversion_axiom
  (assert
  (forall ((x light))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x light)) (! (in_range2 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-datatypes ((map__ref1 0))
(((map__refqtmk1 (map__content1 (Array Int light))))))
(declare-fun slide1 ((Array Int light) Int Int) (Array Int light))

;; slide_eq
  (assert
  (forall ((a (Array Int light)))
  (forall ((first Int))
  (! (= (slide1 a first first) a) :pattern ((slide1 a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int light)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide1 a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide1 a old_first new_first) i)) ))))))

(define-fun bool_eq2 ((a (Array Int light)) (a__first Int) (a__last Int)
  (b (Array Int light)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_154 Int))
                           (=>
                           (and (<= a__first temp___idx_154)
                           (<= temp___idx_154 a__last))
                           (= (to_rep1 (select a temp___idx_154)) (to_rep1
                                                                  (select b (+ (- b__first a__first) temp___idx_154)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int light)) (b (Array Int light)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq2 b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_154 Int))
  (=> (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (= (to_rep1 (select a temp___idx_154)) (to_rep1
                                         (select b (+ (- b__first a__first) temp___idx_154)))))))))))

(declare-fun safety_property ((Array Int light) (Array Int us_rep)) Bool)

(declare-fun safety_property__function_guard (Bool (Array Int light)
  (Array Int us_rep)) Bool)

(declare-sort tTconflictsSP1 0)

(declare-fun tTconflictsSP1qtint (tTconflictsSP1) Int)

;; tTconflictsSP1'axiom
  (assert
  (forall ((i tTconflictsSP1))
  (and (<= 1 (tTconflictsSP1qtint i)) (<= (tTconflictsSP1qtint i) 8))))

(define-fun in_range3 ((x Int)) Bool (and (<= 1 x) (<= x 8)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq3 (tTconflictsSP1 tTconflictsSP1) Bool)

(declare-const dummy3 tTconflictsSP1)

(declare-datatypes ((tTconflictsSP1__ref 0))
(((tTconflictsSP1__refqtmk (tTconflictsSP1__content tTconflictsSP1)))))
(define-fun tTconflictsSP1__ref_tTconflictsSP1__content__projection ((a tTconflictsSP1__ref)) tTconflictsSP1 
  (tTconflictsSP1__content a))

;; safety_property__post_axiom
  (assert true)

;; safety_property__def_axiom
  (assert
  (forall ((l (Array Int light)))
  (forall ((road_traffic__conflicts (Array Int us_rep)))
  (! (= (= (safety_property l road_traffic__conflicts) true)
     (forall ((temp___217 Int))
     (=> (and (<= 1 temp___217) (<= temp___217 8))
     (let ((c (select road_traffic__conflicts temp___217)))
     (or
     (= (to_rep1
        (select l (to_rep
                  (rec__road_traffic__conflict__left (us_split_fields1 c))))) 0)
     (= (to_rep1
        (select l (to_rep
                  (rec__road_traffic__conflict__right (us_split_fields1 c))))) 0)))))) :pattern (
  (safety_property l road_traffic__conflicts)) ))))

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const p Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(define-fun dynamic_invariant ((temp___expr_165 Int)
  (temp___is_init_161 Bool) (temp___skip_constant_162 Bool)
  (temp___do_toplevel_163 Bool)
  (temp___do_typ_inv_164 Bool)) Bool (=>
                                     (or (= temp___is_init_161 true)
                                     (<= 0 3)) (in_range1 temp___expr_165)))

(define-fun dynamic_invariant1 ((temp___expr_172 Int)
  (temp___is_init_168 Bool) (temp___skip_constant_169 Bool)
  (temp___do_toplevel_170 Bool)
  (temp___do_typ_inv_171 Bool)) Bool (=>
                                     (or (= temp___is_init_168 true)
                                     (<= 0 2)) (in_range2 temp___expr_172)))

(assert
;; defqtvc
 ;; File "road_traffic.ads", line 40, characters 0-0
  (not
  (forall ((conflicts (Array Int us_rep)) (l (Array Int light)) (o light)
  (l1 (Array Int light)))
  (=> (dynamic_invariant p true false true true)
  (=>
  (forall ((conflicts1 (Array Int us_rep)) (l2 (Array Int light)))
  (safety_property__function_guard (safety_property l2 conflicts1) l2
  conflicts1))
  (=> (= (safety_property l conflicts) true)
  (=> (= (to_rep1 (select l p)) 2)
  (=> (= (to_rep1 o) 1)
  (=> (= l1 (store l p o))
  (=>
  (forall ((conflicts1 (Array Int us_rep)) (l2 (Array Int light)))
  (safety_property__function_guard (safety_property l2 conflicts1) l2
  conflicts1)) (= (safety_property l1 conflicts) true)))))))))))
(check-sat)
(exit)
