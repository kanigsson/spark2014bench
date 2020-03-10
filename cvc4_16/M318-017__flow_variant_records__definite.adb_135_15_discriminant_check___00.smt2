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

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (natural natural) Bool)

(declare-const dummy natural)

(declare-datatypes ((natural__ref 0))
(((natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun to_rep ((x natural)) Int (naturalqtint x))

(declare-fun of_rep (Int) natural)

;; inversion_axiom
  (assert
  (forall ((x natural)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x natural)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-sort status 0)

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 2)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (status status) Bool)

(declare-const dummy1 status)

(declare-datatypes ((status__ref 0))
(((status__refqtmk (status__content status)))))
(define-fun status__ref_status__content__projection ((a status__ref)) status 
  (status__content a))

(declare-fun to_rep1 (status) Int)

(declare-fun of_rep1 (Int) status)

;; inversion_axiom
  (assert
  (forall ((x status))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x status)) (! (in_range2 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-datatypes ((us_split_discrs 0))
(((us_split_discrsqtmk (rec__definite__t__d status)))))
(define-fun us_split_discrs_rec__definite__t__d__projection ((a us_split_discrs)) status 
  (rec__definite__t__d a))

(declare-datatypes ((us_split_discrs__ref 0))
(((us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__definite__t__a natural)(rec__definite__t__b natural)(rec__definite__t__x Bool)))))
(define-fun us_split_fields_rec__definite__t__a__projection ((a us_split_fields)) natural 
  (rec__definite__t__a a))

(define-fun us_split_fields_rec__definite__t__b__projection ((a us_split_fields)) natural 
  (rec__definite__t__b a))

(define-fun us_split_fields_rec__definite__t__x__projection ((a us_split_fields)) Bool 
  (rec__definite__t__x a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk
  (us_split_discrs1 us_split_discrs)(us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_discrs__projection ((a us_rep)) us_split_discrs 
  (us_split_discrs1 a))

(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun definite__t__b__pred ((a us_rep)) Bool (= (to_rep1
                                                      (rec__definite__t__d
                                                      (us_split_discrs1 a))) 0))

(define-fun definite__t__x__pred ((a us_rep)) Bool (= (to_rep1
                                                      (rec__definite__t__d
                                                      (us_split_discrs1 a))) 1))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (to_rep1
                           (rec__definite__t__d (us_split_discrs1 a))) 
                        (to_rep1 (rec__definite__t__d (us_split_discrs1 b))))
                        (and
                        (and
                        (= (to_rep
                           (rec__definite__t__a (us_split_fields1 a))) 
                        (to_rep (rec__definite__t__a (us_split_fields1 b))))
                        (=> (definite__t__b__pred a)
                        (= (to_rep
                           (rec__definite__t__b (us_split_fields1 a))) 
                        (to_rep (rec__definite__t__b (us_split_fields1 b))))))
                        (=> (definite__t__x__pred a)
                        (= (ite (rec__definite__t__x (us_split_fields1 a)) 1 0) (ite 
                        (rec__definite__t__x (us_split_fields1 b)) 1 0)))))
                   true false))

(define-fun in_range3 ((rec__definite__t__d1 Int)
  (a us_split_discrs)) Bool (= rec__definite__t__d1 (to_rep1
                                                    (rec__definite__t__d a))))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const definite__t__d__first__bit Int)

(declare-const definite__t__d__last__bit Int)

(declare-const definite__t__d__position Int)

;; definite__t__d__first__bit_axiom
  (assert (<= 0 definite__t__d__first__bit))

;; definite__t__d__last__bit_axiom
  (assert (< definite__t__d__first__bit definite__t__d__last__bit))

;; definite__t__d__position_axiom
  (assert (<= 0 definite__t__d__position))

(declare-const definite__t__a__first__bit Int)

(declare-const definite__t__a__last__bit Int)

(declare-const definite__t__a__position Int)

;; definite__t__a__first__bit_axiom
  (assert (<= 0 definite__t__a__first__bit))

;; definite__t__a__last__bit_axiom
  (assert (< definite__t__a__first__bit definite__t__a__last__bit))

;; definite__t__a__position_axiom
  (assert (<= 0 definite__t__a__position))

(declare-const definite__t__b__first__bit Int)

(declare-const definite__t__b__last__bit Int)

(declare-const definite__t__b__position Int)

;; definite__t__b__first__bit_axiom
  (assert (<= 0 definite__t__b__first__bit))

;; definite__t__b__last__bit_axiom
  (assert (< definite__t__b__first__bit definite__t__b__last__bit))

;; definite__t__b__position_axiom
  (assert (<= 0 definite__t__b__position))

(declare-const definite__t__x__first__bit Int)

(declare-const definite__t__x__last__bit Int)

(declare-const definite__t__x__position Int)

;; definite__t__x__first__bit_axiom
  (assert (<= 0 definite__t__x__first__bit))

;; definite__t__x__last__bit_axiom
  (assert (< definite__t__x__first__bit definite__t__x__last__bit))

;; definite__t__x__position_axiom
  (assert (<= 0 definite__t__x__position))

(declare-fun user_eq2 (us_rep us_rep) Bool)

(declare-const dummy2 us_rep)

(declare-datatypes ((t__ref 0))
(((t__refqtmk (t__content us_rep)))))
(define-fun t__ref_t__content__projection ((a t__ref)) us_rep (t__content a))

(define-fun default_initial_assumption ((temp___expr_167 us_rep)
  (temp___skip_top_level_168 Bool)) Bool (= (to_rep1
                                            (rec__definite__t__d
                                            (us_split_discrs1
                                            temp___expr_167))) 2))

(declare-const x__attr__constrained Bool)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const r32b Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const r35b Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const r38b Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(define-fun dynamic_invariant ((temp___expr_158 Int)
  (temp___is_init_154 Bool) (temp___skip_constant_155 Bool)
  (temp___do_toplevel_156 Bool)
  (temp___do_typ_inv_157 Bool)) Bool (=>
                                     (or (= temp___is_init_154 true)
                                     (<= 0 2)) (in_range2 temp___expr_158)))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const definite__t__d__first__bit1 Int)

(declare-const definite__t__d__last__bit1 Int)

(declare-const definite__t__d__position1 Int)

;; definite__t__d__first__bit_axiom
  (assert (<= 0 definite__t__d__first__bit1))

;; definite__t__d__last__bit_axiom
  (assert (< definite__t__d__first__bit1 definite__t__d__last__bit1))

;; definite__t__d__position_axiom
  (assert (<= 0 definite__t__d__position1))

(declare-const definite__t__x__first__bit1 Int)

(declare-const definite__t__x__last__bit1 Int)

(declare-const definite__t__x__position1 Int)

;; definite__t__x__first__bit_axiom
  (assert (<= 0 definite__t__x__first__bit1))

;; definite__t__x__last__bit_axiom
  (assert (< definite__t__x__first__bit1 definite__t__x__last__bit1))

;; definite__t__x__position_axiom
  (assert (<= 0 definite__t__x__position1))

(declare-const definite__t__a__first__bit1 Int)

(declare-const definite__t__a__last__bit1 Int)

(declare-const definite__t__a__position1 Int)

;; definite__t__a__first__bit_axiom
  (assert (<= 0 definite__t__a__first__bit1))

;; definite__t__a__last__bit_axiom
  (assert (< definite__t__a__first__bit1 definite__t__a__last__bit1))

;; definite__t__a__position_axiom
  (assert (<= 0 definite__t__a__position1))

(declare-const definite__t__b__first__bit1 Int)

(declare-const definite__t__b__last__bit1 Int)

(declare-const definite__t__b__position1 Int)

;; definite__t__b__first__bit_axiom
  (assert (<= 0 definite__t__b__first__bit1))

;; definite__t__b__last__bit_axiom
  (assert (< definite__t__b__first__bit1 definite__t__b__last__bit1))

;; definite__t__b__position_axiom
  (assert (<= 0 definite__t__b__position1))

(declare-fun user_eq3 (us_rep us_rep) Bool)

(declare-const dummy3 us_rep)

(declare-datatypes ((t33b__ref 0))
(((t33b__refqtmk (t33b__content us_rep)))))
(define-fun t33b__ref_t33b__content__projection ((a t33b__ref)) us_rep 
  (t33b__content a))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-const definite__t__d__first__bit2 Int)

(declare-const definite__t__d__last__bit2 Int)

(declare-const definite__t__d__position2 Int)

;; definite__t__d__first__bit_axiom
  (assert (<= 0 definite__t__d__first__bit2))

;; definite__t__d__last__bit_axiom
  (assert (< definite__t__d__first__bit2 definite__t__d__last__bit2))

;; definite__t__d__position_axiom
  (assert (<= 0 definite__t__d__position2))

(declare-const definite__t__b__first__bit2 Int)

(declare-const definite__t__b__last__bit2 Int)

(declare-const definite__t__b__position2 Int)

;; definite__t__b__first__bit_axiom
  (assert (<= 0 definite__t__b__first__bit2))

;; definite__t__b__last__bit_axiom
  (assert (< definite__t__b__first__bit2 definite__t__b__last__bit2))

;; definite__t__b__position_axiom
  (assert (<= 0 definite__t__b__position2))

(declare-const definite__t__a__first__bit2 Int)

(declare-const definite__t__a__last__bit2 Int)

(declare-const definite__t__a__position2 Int)

;; definite__t__a__first__bit_axiom
  (assert (<= 0 definite__t__a__first__bit2))

;; definite__t__a__last__bit_axiom
  (assert (< definite__t__a__first__bit2 definite__t__a__last__bit2))

;; definite__t__a__position_axiom
  (assert (<= 0 definite__t__a__position2))

(declare-const definite__t__x__first__bit2 Int)

(declare-const definite__t__x__last__bit2 Int)

(declare-const definite__t__x__position2 Int)

;; definite__t__x__first__bit_axiom
  (assert (<= 0 definite__t__x__first__bit2))

;; definite__t__x__last__bit_axiom
  (assert (< definite__t__x__first__bit2 definite__t__x__last__bit2))

;; definite__t__x__position_axiom
  (assert (<= 0 definite__t__x__position2))

(declare-fun user_eq4 (us_rep us_rep) Bool)

(declare-const dummy4 us_rep)

(declare-datatypes ((t36b__ref 0))
(((t36b__refqtmk (t36b__content us_rep)))))
(define-fun t36b__ref_t36b__content__projection ((a t36b__ref)) us_rep 
  (t36b__content a))

(declare-const value__size3 Int)

(declare-const object__size3 Int)

(declare-const alignment3 Int)

;; value__size_axiom
  (assert (<= 0 value__size3))

;; object__size_axiom
  (assert (<= 0 object__size3))

;; alignment_axiom
  (assert (<= 0 alignment3))

(declare-const definite__t__d__first__bit3 Int)

(declare-const definite__t__d__last__bit3 Int)

(declare-const definite__t__d__position3 Int)

;; definite__t__d__first__bit_axiom
  (assert (<= 0 definite__t__d__first__bit3))

;; definite__t__d__last__bit_axiom
  (assert (< definite__t__d__first__bit3 definite__t__d__last__bit3))

;; definite__t__d__position_axiom
  (assert (<= 0 definite__t__d__position3))

(declare-const definite__t__b__first__bit3 Int)

(declare-const definite__t__b__last__bit3 Int)

(declare-const definite__t__b__position3 Int)

;; definite__t__b__first__bit_axiom
  (assert (<= 0 definite__t__b__first__bit3))

;; definite__t__b__last__bit_axiom
  (assert (< definite__t__b__first__bit3 definite__t__b__last__bit3))

;; definite__t__b__position_axiom
  (assert (<= 0 definite__t__b__position3))

(declare-const definite__t__x__first__bit3 Int)

(declare-const definite__t__x__last__bit3 Int)

(declare-const definite__t__x__position3 Int)

;; definite__t__x__first__bit_axiom
  (assert (<= 0 definite__t__x__first__bit3))

;; definite__t__x__last__bit_axiom
  (assert (< definite__t__x__first__bit3 definite__t__x__last__bit3))

;; definite__t__x__position_axiom
  (assert (<= 0 definite__t__x__position3))

(declare-const definite__t__a__first__bit3 Int)

(declare-const definite__t__a__last__bit3 Int)

(declare-const definite__t__a__position3 Int)

;; definite__t__a__first__bit_axiom
  (assert (<= 0 definite__t__a__first__bit3))

;; definite__t__a__last__bit_axiom
  (assert (< definite__t__a__first__bit3 definite__t__a__last__bit3))

;; definite__t__a__position_axiom
  (assert (<= 0 definite__t__a__position3))

(declare-fun user_eq5 (us_rep us_rep) Bool)

(declare-const dummy5 us_rep)

(declare-datatypes ((t39b__ref 0))
(((t39b__refqtmk (t39b__content us_rep)))))
(define-fun t39b__ref_t39b__content__projection ((a t39b__ref)) us_rep 
  (t39b__content a))

(define-fun dynamic_invariant1 ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range1
                                    temp___expr_39)))

(assert
;; defqtvc
 ;; File "definite.adb", line 125, characters 0-0
  (not
  (forall ((x__split_discrs status) (y Int) (o Int) (y1 Int)
  (spark__branch Bool) (spark__branch1 Bool)
  (definite__test_02_nd__R35b__assume Int) (o1 status))
  (=> (dynamic_invariant y false false true true)
  (=> (= (to_rep1 x__split_discrs) o)
  (=> (= y1 o)
  (=> (= spark__branch (ite (= y1 0) true false))
  (=> (not (= spark__branch true))
  (=> (= spark__branch1 (ite (= y1 1) true false))
  (=> (= spark__branch1 true)
  (=> (= (to_rep1 x__split_discrs) definite__test_02_nd__R35b__assume)
  (=> (= definite__test_02_nd__R35b__assume r35b)
  (=> (dynamic_invariant r35b true false true true)
  (=> (= (to_rep1 o1) 1)
  (=> (= x__attr__constrained true) (= o1 x__split_discrs))))))))))))))))
(check-sat)
(exit)
