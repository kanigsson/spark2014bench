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

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk (rec__base__t__c integer)(rec__ext__ us_private)))))
(define-fun us_split_fields_rec__base__t__c__projection ((a us_split_fields)) integer 
  (rec__base__t__c a))

(define-fun us_split_fields_rec__ext____projection ((a us_split_fields)) us_private 
  (rec__ext__ a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk (us_split_fields1 us_split_fields)(attr__tag Int)))))
(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun us_rep_attr__tag__projection ((a us_rep)) Int (attr__tag a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (= (to_rep (rec__base__t__c (us_split_fields1 a))) 
                   (to_rep (rec__base__t__c (us_split_fields1 b)))) true
                   false))

(declare-fun us_dispatch_eq (us_rep us_rep) Bool)

(declare-const us_tag Int)

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const base__t__c__first__bit Int)

(declare-const base__t__c__last__bit Int)

(declare-const base__t__c__position Int)

;; base__t__c__first__bit_axiom
  (assert (<= 0 base__t__c__first__bit))

;; base__t__c__last__bit_axiom
  (assert (< base__t__c__first__bit base__t__c__last__bit))

;; base__t__c__position_axiom
  (assert (<= 0 base__t__c__position))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-const dummy1 us_rep)

(declare-datatypes ((t__ref 0))
(((t__refqtmk (t__content us_rep)))))
(define-fun t__ref_t__content__projection ((a t__ref)) us_rep (t__content a))

(declare-datatypes ((us_split_fields2 0))
(((us_split_fieldsqtmk1
  (rec__ext__u__d integer)(rec__base__t__c1 integer)(rec__ext__1 us_private)))))
(define-fun us_split_fields_rec__ext__u__d__projection ((a us_split_fields2)) integer 
  (rec__ext__u__d a))

(define-fun us_split_fields_rec__base__t__c__2__projection ((a us_split_fields2)) integer 
  (rec__base__t__c1 a))

(define-fun us_split_fields_rec__ext____2__projection ((a us_split_fields2)) us_private 
  (rec__ext__1 a))

(declare-datatypes ((us_split_fields__ref1 0))
(((us_split_fields__refqtmk1 (us_split_fields__content1 us_split_fields2)))))
(define-fun us_split_fields__ref___split_fields__content__2__projection ((a us_split_fields__ref1)) us_split_fields2 
  (us_split_fields__content1 a))

(declare-datatypes ((us_rep1 0))
(((us_repqtmk1 (us_split_fields3 us_split_fields2)(attr__tag1 Int)))))
(define-fun us_rep___split_fields__2__projection ((a us_rep1)) us_split_fields2 
  (us_split_fields3 a))

(define-fun us_rep_attr__tag__2__projection ((a us_rep1)) Int (attr__tag1 a))

(declare-fun hide_ext__ (integer us_private) us_private)

(declare-fun extract__ext__u__d (us_private) integer)

;; extract__ext__u__d__conv
  (assert
  (forall ((ext__u__d integer))
  (forall ((rec__ext__2 us_private))
  (= (extract__ext__u__d (hide_ext__ ext__u__d rec__ext__2)) ext__u__d))))

(declare-fun extract__ext__ (us_private) us_private)

(define-fun to_base ((a us_rep1)) us_rep (us_repqtmk
                                         (us_split_fieldsqtmk
                                         (rec__base__t__c1
                                         (us_split_fields3 a))
                                         (hide_ext__
                                         (rec__ext__u__d
                                         (us_split_fields3 a))
                                         (rec__ext__1 (us_split_fields3 a))))
                                         (attr__tag1 a)))

(define-fun of_base ((r us_rep)) us_rep1 (us_repqtmk1
                                         (us_split_fieldsqtmk1
                                         (extract__ext__u__d
                                         (rec__ext__ (us_split_fields1 r)))
                                         (rec__base__t__c
                                         (us_split_fields1 r))
                                         (extract__ext__
                                         (rec__ext__ (us_split_fields1 r))))
                                         (attr__tag r)))

(define-fun bool_eq1 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (= (to_rep (rec__ext__u__d (us_split_fields3 a))) 
                         (to_rep (rec__ext__u__d (us_split_fields3 b))))
                         (= (to_rep (rec__base__t__c1 (us_split_fields3 a))) 
                         (to_rep (rec__base__t__c1 (us_split_fields3 b)))))
                    true false))

(declare-const us_tag1 Int)

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const ext__u__d__first__bit Int)

(declare-const ext__u__d__last__bit Int)

(declare-const ext__u__d__position Int)

;; ext__u__d__first__bit_axiom
  (assert (<= 0 ext__u__d__first__bit))

;; ext__u__d__last__bit_axiom
  (assert (< ext__u__d__first__bit ext__u__d__last__bit))

;; ext__u__d__position_axiom
  (assert (<= 0 ext__u__d__position))

(declare-const base__t__c__first__bit1 Int)

(declare-const base__t__c__last__bit1 Int)

(declare-const base__t__c__position1 Int)

;; base__t__c__first__bit_axiom
  (assert (<= 0 base__t__c__first__bit1))

;; base__t__c__last__bit_axiom
  (assert (< base__t__c__first__bit1 base__t__c__last__bit1))

;; base__t__c__position_axiom
  (assert (<= 0 base__t__c__position1))

(declare-fun user_eq2 (us_rep1 us_rep1) Bool)

(declare-const dummy2 us_rep1)

(declare-datatypes ((u__ref 0))
(((u__refqtmk (u__content us_rep1)))))
(define-fun u__ref_u__content__projection ((a u__ref)) us_rep1 (u__content a))

(declare-const x us_rep1)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647)) (in_range
                                    temp___expr_18)))

(declare-fun sum (us_rep) Int)

(declare-fun sum__function_guard (Int us_rep) Bool)

(declare-fun sum1 (Int us_rep) Int)

(declare-fun sum__function_guard1 (Int Int us_rep) Bool)

(declare-fun sum2 (us_rep1) Int)

(declare-fun sum__function_guard2 (Int us_rep1) Bool)

(declare-fun sum3 (Int us_rep1) Int)

(declare-fun sum__function_guard3 (Int Int us_rep1) Bool)

(define-fun default_initial_assumption ((temp___expr_165 us_rep)
  (temp___skip_top_level_166 Bool)) Bool (= (attr__tag temp___expr_165) 
  us_tag))

;; sum__post_axiom
  (assert
  (forall ((x1 us_rep))
  (! (let ((result (sum x1)))
     (=> (sum__function_guard result x1) (dynamic_invariant result true false
     true true))) :pattern ((sum x1)) )))

;; sum__post__dispatch_axiom
  (assert
  (forall ((attr__tag2 Int))
  (forall ((x1 us_rep))
  (! (let ((result (sum1 attr__tag2 x1)))
     (=> (sum__function_guard1 result attr__tag2 x1) (dynamic_invariant
     result true false true true))) :pattern ((sum1 attr__tag2 x1)) ))))

;; ext__u__compat_axiom
  (assert
  (forall ((x1 us_rep))
  (! (=> (sum__function_guard1 (sum1 us_tag1 x1) us_tag1 x1)
     (and
     (forall ((x2 us_rep)) (sum__function_guard2 (sum2 (of_base x2))
     (of_base x2))) (= (sum2 (of_base x1)) (sum1 us_tag1 x1)))) :pattern (
  (sum1 us_tag1 x1)) )))

;; base__t__compat_axiom
  (assert
  (forall ((x1 us_rep))
  (! (=> (sum__function_guard1 (sum1 us_tag x1) us_tag x1)
     (and (forall ((x2 us_rep)) (sum__function_guard (sum x2) x2))
     (= (sum x1) (sum1 us_tag x1)))) :pattern ((sum1 us_tag x1)) )))

;; sum__def_axiom
  (assert
  (forall ((x1 us_rep))
  (! (= (sum x1) (to_rep (rec__base__t__c (us_split_fields1 x1)))) :pattern (
  (sum x1)) )))

(define-fun default_initial_assumption1 ((temp___expr_173 us_rep1)
  (temp___skip_top_level_174 Bool)) Bool (= (attr__tag1 temp___expr_173) 
  us_tag1))

;; sum__post_axiom
  (assert
  (forall ((x1 us_rep1))
  (! (let ((result (sum2 x1)))
     (=> (sum__function_guard2 result x1) (dynamic_invariant result true
     false true true))) :pattern ((sum2 x1)) )))

;; sum__post__dispatch_axiom
  (assert
  (forall ((attr__tag2 Int))
  (forall ((x1 us_rep1))
  (! (let ((result (sum3 attr__tag2 x1)))
     (=> (sum__function_guard3 result attr__tag2 x1) (dynamic_invariant
     result true false true true))) :pattern ((sum3 attr__tag2 x1)) ))))

;; ext__u__compat_axiom
  (assert
  (forall ((x1 us_rep1))
  (! (=> (sum__function_guard3 (sum3 us_tag1 x1) us_tag1 x1)
     (and (forall ((x2 us_rep1)) (sum__function_guard2 (sum2 x2) x2))
     (= (sum2 x1) (sum3 us_tag1 x1)))) :pattern ((sum3 us_tag1 x1)) )))

;; sum__def_axiom
  (assert
  (forall ((x1 us_rep1))
  (! (and
     (forall ((x2 us_rep1)) (sum__function_guard (sum (to_base x2))
     (to_base x2)))
     (= (sum2 x1) (+ (sum (to_base x1)) (to_rep
                                        (rec__ext__u__d
                                        (us_split_fields3 x1)))))) :pattern (
  (sum2 x1)) )))

(assert
;; defqtvc
 ;; File "ext.ads", line 13, characters 0-0
  (not
  (forall ((o Int))
  (=> (= (to_rep (rec__ext__u__d (us_split_fields3 x))) o)
  (let ((o1 (to_base x)))
  (let ((o2 (sum o1)))
  (=>
  (and (sum__function_guard o2 o1)
  (and (dynamic_invariant o2 true false true true)
  (= o2 (to_rep (rec__base__t__c (us_split_fields1 o1)))))) (in_range
  (+ o2 o)))))))))
(check-sat)
(exit)
