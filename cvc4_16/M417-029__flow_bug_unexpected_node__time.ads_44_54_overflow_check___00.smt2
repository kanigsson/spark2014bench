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

(define-fun length ((x Int) (y Int)) Int (ite (<= x y) (+ (- y x) 1) 0))

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

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (natural natural) Bool)

(declare-const dummy1 natural)

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
  (forall ((x natural)) (! (in_range2 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-sort minutes_t 0)

(declare-fun minutes_tqtint (minutes_t) Int)

;; minutes_t'axiom
  (assert
  (forall ((i minutes_t))
  (and (<= 0 (minutes_tqtint i)) (<= (minutes_tqtint i) 59))))

(define-fun in_range3 ((x Int)) Bool (and (<= 0 x) (<= x 59)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (minutes_t minutes_t) Bool)

(declare-const dummy2 minutes_t)

(declare-datatypes ((minutes_t__ref 0))
(((minutes_t__refqtmk (minutes_t__content minutes_t)))))
(define-fun minutes_t__ref_minutes_t__content__projection ((a minutes_t__ref)) minutes_t 
  (minutes_t__content a))

(define-fun to_rep1 ((x minutes_t)) Int (minutes_tqtint x))

(declare-fun of_rep1 (Int) minutes_t)

;; inversion_axiom
  (assert
  (forall ((x minutes_t))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x minutes_t)) (! (in_range3
  (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range3 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-sort seconds_t 0)

(declare-fun seconds_tqtint (seconds_t) Int)

;; seconds_t'axiom
  (assert
  (forall ((i seconds_t))
  (and (<= 0 (seconds_tqtint i)) (<= (seconds_tqtint i) 59))))

(define-fun in_range4 ((x Int)) Bool (and (<= 0 x) (<= x 59)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq3 (seconds_t seconds_t) Bool)

(declare-const dummy3 seconds_t)

(declare-datatypes ((seconds_t__ref 0))
(((seconds_t__refqtmk (seconds_t__content seconds_t)))))
(define-fun seconds_t__ref_seconds_t__content__projection ((a seconds_t__ref)) seconds_t 
  (seconds_t__content a))

(define-fun to_rep2 ((x seconds_t)) Int (seconds_tqtint x))

(declare-fun of_rep2 (Int) seconds_t)

;; inversion_axiom
  (assert
  (forall ((x seconds_t))
  (! (= (of_rep2 (to_rep2 x)) x) :pattern ((to_rep2 x)) )))

;; range_axiom
  (assert
  (forall ((x seconds_t)) (! (in_range4
  (to_rep2 x)) :pattern ((to_rep2 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range4 x) (= (to_rep2 (of_rep2 x)) x)) :pattern ((to_rep2
                                                              (of_rep2 x))) )))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__time__t__hours natural)(rec__time__t__minutes minutes_t)(rec__time__t__seconds seconds_t)))))
(define-fun us_split_fields_rec__time__t__hours__projection ((a us_split_fields)) natural 
  (rec__time__t__hours a))

(define-fun us_split_fields_rec__time__t__minutes__projection ((a us_split_fields)) minutes_t 
  (rec__time__t__minutes a))

(define-fun us_split_fields_rec__time__t__seconds__projection ((a us_split_fields)) seconds_t 
  (rec__time__t__seconds a))

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
                        (and
                        (= (to_rep
                           (rec__time__t__hours (us_split_fields1 a))) 
                        (to_rep (rec__time__t__hours (us_split_fields1 b))))
                        (= (to_rep1
                           (rec__time__t__minutes (us_split_fields1 a))) 
                        (to_rep1
                        (rec__time__t__minutes (us_split_fields1 b)))))
                        (= (to_rep2
                           (rec__time__t__seconds (us_split_fields1 a))) 
                        (to_rep2
                        (rec__time__t__seconds (us_split_fields1 b)))))
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

(declare-const time__t__hours__first__bit Int)

(declare-const time__t__hours__last__bit Int)

(declare-const time__t__hours__position Int)

;; time__t__hours__first__bit_axiom
  (assert (<= 0 time__t__hours__first__bit))

;; time__t__hours__last__bit_axiom
  (assert (< time__t__hours__first__bit time__t__hours__last__bit))

;; time__t__hours__position_axiom
  (assert (<= 0 time__t__hours__position))

(declare-const time__t__minutes__first__bit Int)

(declare-const time__t__minutes__last__bit Int)

(declare-const time__t__minutes__position Int)

;; time__t__minutes__first__bit_axiom
  (assert (<= 0 time__t__minutes__first__bit))

;; time__t__minutes__last__bit_axiom
  (assert (< time__t__minutes__first__bit time__t__minutes__last__bit))

;; time__t__minutes__position_axiom
  (assert (<= 0 time__t__minutes__position))

(declare-const time__t__seconds__first__bit Int)

(declare-const time__t__seconds__last__bit Int)

(declare-const time__t__seconds__position Int)

;; time__t__seconds__first__bit_axiom
  (assert (<= 0 time__t__seconds__first__bit))

;; time__t__seconds__last__bit_axiom
  (assert (< time__t__seconds__first__bit time__t__seconds__last__bit))

;; time__t__seconds__position_axiom
  (assert (<= 0 time__t__seconds__position))

(declare-fun user_eq4 (us_rep us_rep) Bool)

(declare-const dummy4 us_rep)

(declare-datatypes ((t__ref 0))
(((t__refqtmk (t__content us_rep)))))
(define-fun t__ref_t__content__projection ((a t__ref)) us_rep (t__content a))

(declare-const max us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const x us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(define-fun dynamic_invariant ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range2
                                    temp___expr_39)))

(define-fun dynamic_invariant1 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(define-fun dynamic_invariant2 ((temp___expr_159 Int)
  (temp___is_init_155 Bool) (temp___skip_constant_156 Bool)
  (temp___do_toplevel_157 Bool)
  (temp___do_typ_inv_158 Bool)) Bool (=>
                                     (or (= temp___is_init_155 true)
                                     (<= 0 59)) (in_range3 temp___expr_159)))

(define-fun dynamic_invariant3 ((temp___expr_166 Int)
  (temp___is_init_162 Bool) (temp___skip_constant_163 Bool)
  (temp___do_toplevel_164 Bool)
  (temp___do_typ_inv_165 Bool)) Bool (=>
                                     (or (= temp___is_init_162 true)
                                     (<= 0 59)) (in_range4 temp___expr_166)))

(declare-const rliteral natural)

;; rliteral_axiom
  (assert (= (naturalqtint rliteral) 2147483647))

(declare-const rliteral1 minutes_t)

;; rliteral_axiom
  (assert (= (minutes_tqtint rliteral1) 59))

(declare-const rliteral2 seconds_t)

;; rliteral_axiom
  (assert (= (seconds_tqtint rliteral2) 59))

;; max__def_axiom
  (assert
  (= max (us_repqtmk (us_split_fieldsqtmk rliteral rliteral1 rliteral2))))

(declare-const rliteral3 seconds_t)

;; rliteral_axiom
  (assert (= (seconds_tqtint rliteral3) 0))

(declare-const rliteral4 minutes_t)

;; rliteral_axiom
  (assert (= (minutes_tqtint rliteral4) 0))

(assert
;; defqtvc
 ;; File "time.ads", line 22, characters 0-0
  (not
  (=> (= (us_repqtmk (us_split_fieldsqtmk rliteral rliteral1 rliteral2)) 
  max)
  (=> (not (= (bool_eq x max) true))
  (forall ((time__t_increment__result us_split_fields))
  (=>
  (exists ((result____split_fields us_split_fields))
  (and (= result____split_fields (us_split_fields1 x))
  (exists ((o Int))
  (and (= (to_rep2 (rec__time__t__seconds (us_split_fields1 x))) o)
  (exists ((spark__branch Bool))
  (and (= spark__branch (ite (< o 59) true false))
  (ite (= spark__branch true)
  (exists ((o1 Int))
  (and (= (to_rep2 (rec__time__t__seconds result____split_fields)) o1)
  (let ((o2 (+ o1 1)))
  (and (in_range4 o2)
  (exists ((o3 seconds_t))
  (and (= (to_rep2 o3) o2)
  (exists ((result____split_fields1 us_split_fields))
  (and
  (= result____split_fields1 (us_split_fieldsqtmk
                             (rec__time__t__hours result____split_fields)
                             (rec__time__t__minutes result____split_fields)
                             o3))
  (= time__t_increment__result result____split_fields1)))))))))
  (exists ((result____split_fields1 us_split_fields))
  (and
  (= result____split_fields1 (us_split_fieldsqtmk
                             (rec__time__t__hours result____split_fields)
                             (rec__time__t__minutes result____split_fields)
                             rliteral3))
  (exists ((o1 Int))
  (and (= (to_rep1 (rec__time__t__minutes (us_split_fields1 x))) o1)
  (exists ((spark__branch1 Bool))
  (and (= spark__branch1 (ite (< o1 59) true false))
  (ite (= spark__branch1 true)
  (exists ((o2 Int))
  (and (= (to_rep1 (rec__time__t__minutes result____split_fields1)) o2)
  (let ((o3 (+ o2 1)))
  (and (in_range3 o3)
  (exists ((o4 minutes_t))
  (and (= (to_rep1 o4) o3)
  (exists ((result____split_fields2 us_split_fields))
  (and
  (= result____split_fields2 (us_split_fieldsqtmk
                             (rec__time__t__hours result____split_fields1) o4
                             (rec__time__t__seconds result____split_fields1)))
  (= time__t_increment__result result____split_fields2)))))))))
  (exists ((result____split_fields2 us_split_fields))
  (and
  (= result____split_fields2 (us_split_fieldsqtmk
                             (rec__time__t__hours result____split_fields1)
                             rliteral4
                             (rec__time__t__seconds result____split_fields1)))
  (exists ((o2 Int))
  (and (= (to_rep (rec__time__t__hours result____split_fields2)) o2)
  (let ((o3 (+ o2 1)))
  (and (in_range1 o3)
  (exists ((o4 natural))
  (and (= (to_rep o4) o3)
  (exists ((result____split_fields3 us_split_fields))
  (and
  (= result____split_fields3 (us_split_fieldsqtmk o4
                             (rec__time__t__minutes result____split_fields2)
                             (rec__time__t__seconds result____split_fields2)))
  (= time__t_increment__result result____split_fields3)))))))))))))))))))))))))
  (=>
  (=> (= (< (to_rep2 (rec__time__t__seconds (us_split_fields1 x))) 59) true)
  (and
  (and
  (= (to_rep2 (rec__time__t__seconds time__t_increment__result)) (+ (to_rep2
                                                                    (rec__time__t__seconds
                                                                    (us_split_fields1
                                                                    x))) 1))
  (= (to_rep1 (rec__time__t__minutes time__t_increment__result)) (to_rep1
                                                                 (rec__time__t__minutes
                                                                 (us_split_fields1
                                                                 x)))))
  (= (to_rep (rec__time__t__hours time__t_increment__result)) (to_rep
                                                              (rec__time__t__hours
                                                              (us_split_fields1
                                                              x))))))
  (=>
  (=>
  (= (and (= (to_rep2 (rec__time__t__seconds (us_split_fields1 x))) 59) (< 
  (to_rep1 (rec__time__t__minutes (us_split_fields1 x))) 59)) true)
  (and
  (and (= (to_rep2 (rec__time__t__seconds time__t_increment__result)) 0)
  (= (to_rep1 (rec__time__t__minutes time__t_increment__result)) (+ (to_rep1
                                                                    (rec__time__t__minutes
                                                                    (us_split_fields1
                                                                    x))) 1)))
  (= (to_rep (rec__time__t__hours time__t_increment__result)) (to_rep
                                                              (rec__time__t__hours
                                                              (us_split_fields1
                                                              x))))))
  (=>
  (= (and (= (to_rep2 (rec__time__t__seconds (us_split_fields1 x))) 59) (= 
  (to_rep1 (rec__time__t__minutes (us_split_fields1 x))) 59)) true)
  (forall ((o Bool))
  (=>
  (exists ((o1 Int))
  (and (= (to_rep2 (rec__time__t__seconds time__t_increment__result)) o1)
  (ite (= o1 0)
  (exists ((o2 Int))
  (and (= (to_rep1 (rec__time__t__minutes time__t_increment__result)) o2)
  (= o (ite (= o2 0) true false)))) (= o false))))
  (=> (= o true)
  (forall ((o1 Int))
  (=> (= (to_rep (rec__time__t__hours (us_split_fields1 x))) o1) (in_range1
  (+ o1 1))))))))))))))))
(check-sat)
(exit)
