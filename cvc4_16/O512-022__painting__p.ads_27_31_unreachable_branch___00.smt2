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

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (integer integer) Bool)

(declare-const dummy integer)

(declare-datatypes ((integer__ref 0))
(((integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(define-fun to_rep ((x integer)) Int (integerqtint x))

(declare-fun of_rep (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk (rec__p__dot__x integer)(rec__p__dot__y integer)))))
(define-fun us_split_fields_rec__p__dot__x__projection ((a us_split_fields)) integer 
  (rec__p__dot__x a))

(define-fun us_split_fields_rec__p__dot__y__projection ((a us_split_fields)) integer 
  (rec__p__dot__y a))

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
                        (= (to_rep (rec__p__dot__x (us_split_fields1 a))) 
                        (to_rep (rec__p__dot__x (us_split_fields1 b))))
                        (= (to_rep (rec__p__dot__y (us_split_fields1 a))) 
                        (to_rep (rec__p__dot__y (us_split_fields1 b)))))
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

(declare-const p__dot__x__first__bit Int)

(declare-const p__dot__x__last__bit Int)

(declare-const p__dot__x__position Int)

;; p__dot__x__first__bit_axiom
  (assert (<= 0 p__dot__x__first__bit))

;; p__dot__x__last__bit_axiom
  (assert (< p__dot__x__first__bit p__dot__x__last__bit))

;; p__dot__x__position_axiom
  (assert (<= 0 p__dot__x__position))

(declare-const p__dot__y__first__bit Int)

(declare-const p__dot__y__last__bit Int)

(declare-const p__dot__y__position Int)

;; p__dot__y__first__bit_axiom
  (assert (<= 0 p__dot__y__first__bit))

;; p__dot__y__last__bit_axiom
  (assert (< p__dot__y__first__bit p__dot__y__last__bit))

;; p__dot__y__position_axiom
  (assert (<= 0 p__dot__y__position))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-const dummy1 us_rep)

(declare-datatypes ((dot__ref 0))
(((dot__refqtmk (dot__content us_rep)))))
(define-fun dot__ref_dot__content__projection ((a dot__ref)) us_rep (dot__content
                                                                    a))

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
                           (forall ((temp___idx_154 Int))
                           (=>
                           (and (<= a__first temp___idx_154)
                           (<= temp___idx_154 a__last))
                           (= (bool_eq (select a temp___idx_154)
                              (select b (+ (- b__first a__first) temp___idx_154))) true))))
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
  (forall ((temp___idx_154 Int))
  (=> (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (= (bool_eq (select a temp___idx_154)
     (select b (+ (- b__first a__first) temp___idx_154))) true))))))))

(declare-const dummy2 (Array Int us_rep))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const component__size Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; component__size_axiom
  (assert (<= 0 component__size))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-fun user_eq2 ((Array Int us_rep) (Array Int us_rep)) Bool)

(declare-datatypes ((us_split_fields2 0))
(((us_split_fieldsqtmk1
  (rec__p__painting__plain (Array Int us_rep))(rec__p__painting__shadow (Array Int us_rep))))))
(define-fun us_split_fields_rec__p__painting__plain__projection ((a us_split_fields2)) (Array Int us_rep) 
  (rec__p__painting__plain a))

(define-fun us_split_fields_rec__p__painting__shadow__projection ((a us_split_fields2)) (Array Int us_rep) 
  (rec__p__painting__shadow a))

(declare-datatypes ((us_split_fields__ref1 0))
(((us_split_fields__refqtmk1 (us_split_fields__content1 us_split_fields2)))))
(define-fun us_split_fields__ref___split_fields__content__2__projection ((a us_split_fields__ref1)) us_split_fields2 
  (us_split_fields__content1 a))

(declare-datatypes ((us_rep1 0))
(((us_repqtmk1 (us_split_fields3 us_split_fields2)))))
(define-fun us_rep___split_fields__2__projection ((a us_rep1)) us_split_fields2 
  (us_split_fields3 a))

(define-fun bool_eq2 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (= (bool_eq1
                            (rec__p__painting__plain (us_split_fields3 a)) 0
                            2 (rec__p__painting__plain (us_split_fields3 b))
                            0 2) true)
                         (= (bool_eq1
                            (rec__p__painting__shadow (us_split_fields3 a)) 0
                            2 (rec__p__painting__shadow (us_split_fields3 b))
                            0 2) true))
                    true false))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-const p__painting__plain__first__bit Int)

(declare-const p__painting__plain__last__bit Int)

(declare-const p__painting__plain__position Int)

;; p__painting__plain__first__bit_axiom
  (assert (<= 0 p__painting__plain__first__bit))

;; p__painting__plain__last__bit_axiom
  (assert (< p__painting__plain__first__bit p__painting__plain__last__bit))

;; p__painting__plain__position_axiom
  (assert (<= 0 p__painting__plain__position))

(declare-const p__painting__shadow__first__bit Int)

(declare-const p__painting__shadow__last__bit Int)

(declare-const p__painting__shadow__position Int)

;; p__painting__shadow__first__bit_axiom
  (assert (<= 0 p__painting__shadow__first__bit))

;; p__painting__shadow__last__bit_axiom
  (assert (< p__painting__shadow__first__bit p__painting__shadow__last__bit))

;; p__painting__shadow__position_axiom
  (assert (<= 0 p__painting__shadow__position))

(declare-fun user_eq3 (us_rep1 us_rep1) Bool)

(declare-const dummy3 us_rep1)

(declare-datatypes ((painting__ref 0))
(((painting__refqtmk (painting__content us_rep1)))))
(define-fun painting__ref_painting__content__projection ((a painting__ref)) us_rep1 
  (painting__content a))

(declare-fun plain_is_dot (us_rep1 Int us_rep) Bool)

(declare-fun plain_is_dot__function_guard (Bool us_rep1 Int us_rep) Bool)

(declare-fun get_plain (us_rep1 Int) us_rep)

(declare-fun get_plain__function_guard (us_rep us_rep1 Int) Bool)

(declare-sort color 0)

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 2)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq4 (color color) Bool)

(declare-const dummy4 color)

(declare-datatypes ((color__ref 0))
(((color__refqtmk (color__content color)))))
(define-fun color__ref_color__content__projection ((a color__ref)) color 
  (color__content a))

(define-fun dynamic_invariant ((temp___expr_171 Int)
  (temp___is_init_167 Bool) (temp___skip_constant_168 Bool)
  (temp___do_toplevel_169 Bool)
  (temp___do_typ_inv_170 Bool)) Bool (=>
                                     (or (= temp___is_init_167 true)
                                     (<= 0 2)) (in_range2 temp___expr_171)))

;; plain_is_dot__post_axiom
  (assert true)

;; plain_is_dot__def_axiom
  (assert
  (forall ((p us_rep1))
  (forall ((c Int))
  (forall ((d us_rep))
  (! (and
     (forall ((p1 us_rep1) (c1 Int)) (get_plain__function_guard
     (get_plain p1 c1) p1 c1))
     (= (= (plain_is_dot p c d) true) (= (bool_eq (get_plain p c) d) true))) :pattern (
  (plain_is_dot p c d)) )))))

(declare-const p us_rep1)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const d us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(define-fun dynamic_invariant1 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

;; get_plain__post_axiom
  (assert true)

;; get_plain__def_axiom
  (assert
  (forall ((p1 us_rep1))
  (forall ((c Int))
  (! (=> (dynamic_invariant c true true true true)
     (= (get_plain p1 c) (let ((temp___223 (rec__p__painting__plain
                                           (us_split_fields3 p1))))
                         (select temp___223 c)))) :pattern ((get_plain p1 c)) ))))

(assert
;; defqtvc
 ;; File "p.ads", line 26, characters 0-0
  (not
  (forall ((usf Int))
  (not
  (= (and (ite (<= 0 usf) true false) (ite (<= usf 2) true false)) true)))))
(check-sat)
(exit)
