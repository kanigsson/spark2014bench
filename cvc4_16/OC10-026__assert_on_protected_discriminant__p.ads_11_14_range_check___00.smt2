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

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range ((x Int)) Bool (and (<= (- 2147483648) x)
                                    (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (integer integer) Bool)

(declare-const dummy integer)

(declare-datatypes ((integer__ref 0))
(((integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(declare-sort positive 0)

(declare-fun positiveqtint (positive) Int)

;; positive'axiom
  (assert
  (forall ((i positive))
  (and (<= 1 (positiveqtint i)) (<= (positiveqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (positive positive) Bool)

(declare-const dummy1 positive)

(declare-datatypes ((positive__ref 0))
(((positive__refqtmk (positive__content positive)))))
(define-fun positive__ref_positive__content__projection ((a positive__ref)) positive 
  (positive__content a))

(declare-datatypes ((us_split_discrs 0))
(((us_split_discrsqtmk (rec__p__pt__j integer)))))
(define-fun us_split_discrs_rec__p__pt__j__projection ((a us_split_discrs)) integer 
  (rec__p__pt__j a))

(declare-datatypes ((us_split_discrs__ref 0))
(((us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk (rec__p__pt__x positive)))))
(define-fun us_split_fields_rec__p__pt__x__projection ((a us_split_fields)) positive 
  (rec__p__pt__x a))

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

(define-fun to_rep ((x integer)) Int (integerqtint x))

(declare-fun of_rep (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                           (of_rep x))) )))

(define-fun in_range2 ((rec__p__pt__j1 Int)
  (a us_split_discrs)) Bool (= rec__p__pt__j1 (to_rep (rec__p__pt__j a))))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const p__pt__j__first__bit Int)

(declare-const p__pt__j__last__bit Int)

(declare-const p__pt__j__position Int)

;; p__pt__j__first__bit_axiom
  (assert (<= 0 p__pt__j__first__bit))

;; p__pt__j__last__bit_axiom
  (assert (< p__pt__j__first__bit p__pt__j__last__bit))

;; p__pt__j__position_axiom
  (assert (<= 0 p__pt__j__position))

(declare-const p__pt__x__first__bit Int)

(declare-const p__pt__x__last__bit Int)

(declare-const p__pt__x__position Int)

;; p__pt__x__first__bit_axiom
  (assert (<= 0 p__pt__x__first__bit))

;; p__pt__x__last__bit_axiom
  (assert (< p__pt__x__first__bit p__pt__x__last__bit))

;; p__pt__x__position_axiom
  (assert (<= 0 p__pt__x__position))

(declare-fun user_eq2 (us_rep us_rep) Bool)

(declare-datatypes ((pt__ref 0))
(((pt__refqtmk (pt__content us_rep)))))
(define-fun pt__ref_pt__content__projection ((a pt__ref)) us_rep (pt__content
                                                                 a))

(declare-datatypes ((us_split_fields2 0))
(((us_split_fieldsqtmk1 (rec__p__pt__x1 positive)))))
(define-fun us_split_fields_rec__p__pt__x__2__projection ((a us_split_fields2)) positive 
  (rec__p__pt__x1 a))

(declare-datatypes ((us_split_fields__ref1 0))
(((us_split_fields__refqtmk1 (us_split_fields__content1 us_split_fields2)))))
(define-fun us_split_fields__ref___split_fields__content__2__projection ((a us_split_fields__ref1)) us_split_fields2 
  (us_split_fields__content1 a))

(declare-datatypes ((us_rep1 0))
(((us_repqtmk1
  (us_split_discrs2 us_split_discrs)(us_split_fields3 us_split_fields2)))))
(define-fun us_rep___split_discrs__2__projection ((a us_rep1)) us_split_discrs 
  (us_split_discrs2 a))

(define-fun us_rep___split_fields__2__projection ((a us_rep1)) us_split_fields2 
  (us_split_fields3 a))

(define-fun to_base ((a us_rep1)) us_rep (us_repqtmk (us_split_discrs2 a)
                                         (us_split_fieldsqtmk
                                         (rec__p__pt__x1
                                         (us_split_fields3 a)))))

(define-fun of_base ((r us_rep)) us_rep1 (us_repqtmk1 (us_split_discrs1 r)
                                         (us_split_fieldsqtmk1
                                         (rec__p__pt__x (us_split_fields1 r)))))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const p__pt__j__first__bit1 Int)

(declare-const p__pt__j__last__bit1 Int)

(declare-const p__pt__j__position1 Int)

;; p__pt__j__first__bit_axiom
  (assert (<= 0 p__pt__j__first__bit1))

;; p__pt__j__last__bit_axiom
  (assert (< p__pt__j__first__bit1 p__pt__j__last__bit1))

;; p__pt__j__position_axiom
  (assert (<= 0 p__pt__j__position1))

(declare-const p__pt__x__first__bit1 Int)

(declare-const p__pt__x__last__bit1 Int)

(declare-const p__pt__x__position1 Int)

;; p__pt__x__first__bit_axiom
  (assert (<= 0 p__pt__x__first__bit1))

;; p__pt__x__last__bit_axiom
  (assert (< p__pt__x__first__bit1 p__pt__x__last__bit1))

;; p__pt__x__position_axiom
  (assert (<= 0 p__pt__x__position1))

(declare-fun user_eq3 (us_rep1 us_rep1) Bool)

(declare-datatypes ((tpoS__ref 0))
(((tpoS__refqtmk (tpoS__content us_rep1)))))
(define-fun tpoS__ref_tpoS__content__projection ((a tpoS__ref)) us_rep1 
  (tpoS__content a))

(declare-const po__split_discrs us_split_discrs)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(define-fun to_rep1 ((x positive)) Int (positiveqtint x))

(declare-fun of_rep1 (Int) positive)

;; inversion_axiom
  (assert
  (forall ((x positive))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x positive)) (! (in_range1 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-fun zero (tuple0) Int)

(declare-fun zero__function_guard (Int tuple0) Bool)

(define-fun dynamic_invariant ((temp___expr_186 us_rep1)
  (temp___is_init_182 Bool) (temp___skip_constant_183 Bool)
  (temp___do_toplevel_184 Bool)
  (temp___do_typ_inv_185 Bool)) Bool (=>
                                     (not (= temp___skip_constant_183 true))
                                     (in_range2 (- 1)
                                     (us_split_discrs1
                                     (to_base temp___expr_186)))))

;; temp___result_191'def
  (assert (zero__function_guard (zero Tuple0) Tuple0))

(define-fun default_initial_assumption ((temp___expr_188 us_rep1)
  (temp___skip_top_level_189 Bool)) Bool (and
                                         (= (to_rep
                                            (rec__p__pt__j
                                            (us_split_discrs2
                                            temp___expr_188))) (- 1))
                                         (= (to_rep1
                                            (rec__p__pt__x1
                                            (us_split_fields3
                                            temp___expr_188))) (zero Tuple0))))

(define-fun dynamic_invariant1 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647)) (in_range
                                    temp___expr_18)))

(define-fun dynamic_invariant2 ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range1
                                    temp___expr_46)))

;; zero__post_axiom
  (assert
  (forall ((us_void_param tuple0))
  (! (let ((result (zero us_void_param)))
     (=> (zero__function_guard result us_void_param) (dynamic_invariant1
     result true false true true))) :pattern ((zero us_void_param)) )))

;; zero__def_axiom
  (assert
  (forall ((us_void_param tuple0))
  (! (= (zero us_void_param) 0) :pattern ((zero us_void_param)) )))

(assert
;; defqtvc
 ;; File "p.ads", line 1, characters 0-0
  (not (in_range (- 1))))
(check-sat)
(exit)
