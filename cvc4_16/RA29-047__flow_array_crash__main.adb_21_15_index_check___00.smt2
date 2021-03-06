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

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(declare-const l Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const h Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

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

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int integer))))))
(declare-fun slide ((Array Int integer) Int Int) (Array Int integer))

;; slide_eq
  (assert
  (forall ((a (Array Int integer)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int integer)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int integer)) (a__first Int) (a__last Int)
  (b (Array Int integer)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_154 Int))
                           (=>
                           (and (<= a__first temp___idx_154)
                           (<= temp___idx_154 a__last))
                           (= (to_rep (select a temp___idx_154)) (to_rep
                                                                 (select b (+ (- b__first a__first) temp___idx_154)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int integer)) (b (Array Int integer)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_154 Int))
  (=> (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (= (to_rep (select a temp___idx_154)) (to_rep
                                        (select b (+ (- b__first a__first) temp___idx_154)))))))))))

(declare-sort t 0)

(declare-fun first (t) integer)

(declare-fun last (t) integer)

(declare-fun mk (Int Int) t)

;; mk_def
  (assert
  (forall ((f Int) (l1 Int))
  (! (=> (in_range1 f)
     (=> (in_range1 l1)
     (and (= (to_rep (first (mk f l1))) f) (= (to_rep (last (mk f l1))) l1)))) :pattern (
  (mk f l1)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range1 low)
                   (and (in_range1 high)
                   (=> (<= low high) (and (in_range1 low) (in_range1 high))))))

(declare-datatypes ((us_t 0))
(((us_tqtmk (elts (Array Int integer))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int integer) (elts a))

(define-fun of_array ((a (Array Int integer)) (f Int)
  (l1 Int)) us_t (us_tqtmk a (mk f l1)))

(define-fun first1 ((a us_t)) Int (to_rep (first (rt a))))

(define-fun last1 ((a us_t)) Int (to_rep (last (rt a))))

(define-fun length ((a us_t)) Int (ite (<= (first1 a) (last1 a))
                                  (+ (- (last1 a) (first1 a)) 1) 0))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const component__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; component__size_axiom
  (assert (<= 0 component__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(define-fun bool_eq1 ((x us_t)
  (y us_t)) Bool (bool_eq (elts x) (to_rep (first (rt x)))
                 (to_rep (last (rt x))) (elts y) (to_rep (first (rt y)))
                 (to_rep (last (rt y)))))

(declare-fun user_eq1 (us_t us_t) Bool)

(declare-const dummy1 us_t)

(declare-datatypes ((t__ref 0))
(((t__refqtmk (t__content us_t)))))
(define-fun t__ref_t__content__projection ((a t__ref)) us_t (t__content a))

(declare-datatypes ((t4b__ref 0))
(((t4b__refqtmk (t4b__content us_t)))))
(define-fun t4b__ref_t4b__content__projection ((a t4b__ref)) us_t (t4b__content
                                                                  a))

(declare-datatypes ((us_split_discrs 0))
(((us_split_discrsqtmk (rec__main__r__ld integer)(rec__main__r__hd integer)))))
(define-fun us_split_discrs_rec__main__r__ld__projection ((a us_split_discrs)) integer 
  (rec__main__r__ld a))

(define-fun us_split_discrs_rec__main__r__hd__projection ((a us_split_discrs)) integer 
  (rec__main__r__hd a))

(declare-datatypes ((us_split_discrs__ref 0))
(((us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk (rec__main__r__c us_t)))))
(define-fun us_split_fields_rec__main__r__c__projection ((a us_split_fields)) us_t 
  (rec__main__r__c a))

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

(define-fun bool_eq2 ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (and
                        (= (to_rep (rec__main__r__ld (us_split_discrs1 a))) 
                        (to_rep (rec__main__r__ld (us_split_discrs1 b))))
                        (= (to_rep (rec__main__r__hd (us_split_discrs1 a))) 
                        (to_rep (rec__main__r__hd (us_split_discrs1 b)))))
                        (= (bool_eq1 (rec__main__r__c (us_split_fields1 a))
                           (rec__main__r__c (us_split_fields1 b))) true))
                   true false))

(define-fun in_range2 ((rec__main__r__ld1 Int) (rec__main__r__hd1 Int)
  (a us_split_discrs)) Bool (and
                            (= rec__main__r__ld1 (to_rep
                                                 (rec__main__r__ld a)))
                            (= rec__main__r__hd1 (to_rep
                                                 (rec__main__r__hd a)))))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const main__r__ld__first__bit Int)

(declare-const main__r__ld__last__bit Int)

(declare-const main__r__ld__position Int)

;; main__r__ld__first__bit_axiom
  (assert (<= 0 main__r__ld__first__bit))

;; main__r__ld__last__bit_axiom
  (assert (< main__r__ld__first__bit main__r__ld__last__bit))

;; main__r__ld__position_axiom
  (assert (<= 0 main__r__ld__position))

(declare-const main__r__hd__first__bit Int)

(declare-const main__r__hd__last__bit Int)

(declare-const main__r__hd__position Int)

;; main__r__hd__first__bit_axiom
  (assert (<= 0 main__r__hd__first__bit))

;; main__r__hd__last__bit_axiom
  (assert (< main__r__hd__first__bit main__r__hd__last__bit))

;; main__r__hd__position_axiom
  (assert (<= 0 main__r__hd__position))

(declare-const main__r__c__first__bit Int)

(declare-const main__r__c__last__bit Int)

(declare-const main__r__c__position Int)

;; main__r__c__first__bit_axiom
  (assert (<= 0 main__r__c__first__bit))

;; main__r__c__last__bit_axiom
  (assert (< main__r__c__first__bit main__r__c__last__bit))

;; main__r__c__position_axiom
  (assert (<= 0 main__r__c__position))

(declare-fun user_eq2 (us_rep us_rep) Bool)

(declare-const dummy2 us_rep)

(declare-datatypes ((r__ref 0))
(((r__refqtmk (r__content us_rep)))))
(define-fun r__ref_r__content__projection ((a r__ref)) us_rep (r__content a))

(define-fun dynamic_invariant1 ((temp___expr_173 us_rep)
  (temp___is_init_169 Bool) (temp___skip_constant_170 Bool)
  (temp___do_toplevel_171 Bool)
  (temp___do_typ_inv_172 Bool)) Bool (let ((temp___175 (rec__main__r__hd
                                                       (us_split_discrs1
                                                       temp___expr_173))))
                                     (let ((temp___174 (rec__main__r__ld
                                                       (us_split_discrs1
                                                       temp___expr_173))))
                                     (and (dynamic_property
                                     (to_rep temp___174) (to_rep temp___175)
                                     (first1
                                     (rec__main__r__c
                                     (us_split_fields1 temp___expr_173)))
                                     (last1
                                     (rec__main__r__c
                                     (us_split_fields1 temp___expr_173))))
                                     (and
                                     (= (first1
                                        (rec__main__r__c
                                        (us_split_fields1 temp___expr_173))) 
                                     (to_rep temp___174))
                                     (= (last1
                                        (rec__main__r__c
                                        (us_split_fields1 temp___expr_173))) 
                                     (to_rep temp___175)))))))

(declare-datatypes ((t10b__ref 0))
(((t10b__refqtmk (t10b__content us_t)))))
(define-fun t10b__ref_t10b__content__projection ((a t10b__ref)) us_t 
  (t10b__content a))

(declare-datatypes ((us_split_fields2 0))
(((us_split_fieldsqtmk1 (rec__main__r__c1 us_t)))))
(define-fun us_split_fields_rec__main__r__c__4__projection ((a us_split_fields2)) us_t 
  (rec__main__r__c1 a))

(declare-datatypes ((us_split_fields__ref1 0))
(((us_split_fields__refqtmk1 (us_split_fields__content1 us_split_fields2)))))
(define-fun us_split_fields__ref___split_fields__content__4__projection ((a us_split_fields__ref1)) us_split_fields2 
  (us_split_fields__content1 a))

(declare-datatypes ((us_rep1 0))
(((us_repqtmk1
  (us_split_discrs2 us_split_discrs)(us_split_fields3 us_split_fields2)))))
(define-fun us_rep___split_discrs__4__projection ((a us_rep1)) us_split_discrs 
  (us_split_discrs2 a))

(define-fun us_rep___split_fields__4__projection ((a us_rep1)) us_split_fields2 
  (us_split_fields3 a))

(define-fun to_base ((a us_rep1)) us_rep (us_repqtmk (us_split_discrs2 a)
                                         (us_split_fieldsqtmk
                                         (let ((temp___160 (rec__main__r__c1
                                                           (us_split_fields3
                                                           a))))
                                         (of_array (to_array temp___160)
                                         (first1 temp___160)
                                         (last1 temp___160))))))

(define-fun of_base ((r us_rep)) us_rep1 (us_repqtmk1 (us_split_discrs1 r)
                                         (us_split_fieldsqtmk1
                                         (let ((temp___159 (rec__main__r__c
                                                           (us_split_fields1
                                                           r))))
                                         (of_array (to_array temp___159)
                                         (first1 temp___159)
                                         (last1 temp___159))))))

(define-fun bool_eq3 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (and
                         (= (to_rep (rec__main__r__ld (us_split_discrs2 a))) 
                         (to_rep (rec__main__r__ld (us_split_discrs2 b))))
                         (= (to_rep (rec__main__r__hd (us_split_discrs2 a))) 
                         (to_rep (rec__main__r__hd (us_split_discrs2 b)))))
                         (= (bool_eq1 (rec__main__r__c1 (us_split_fields3 a))
                            (rec__main__r__c1 (us_split_fields3 b))) true))
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

(declare-const main__r__ld__first__bit1 Int)

(declare-const main__r__ld__last__bit1 Int)

(declare-const main__r__ld__position1 Int)

;; main__r__ld__first__bit_axiom
  (assert (<= 0 main__r__ld__first__bit1))

;; main__r__ld__last__bit_axiom
  (assert (< main__r__ld__first__bit1 main__r__ld__last__bit1))

;; main__r__ld__position_axiom
  (assert (<= 0 main__r__ld__position1))

(declare-const main__r__hd__first__bit1 Int)

(declare-const main__r__hd__last__bit1 Int)

(declare-const main__r__hd__position1 Int)

;; main__r__hd__first__bit_axiom
  (assert (<= 0 main__r__hd__first__bit1))

;; main__r__hd__last__bit_axiom
  (assert (< main__r__hd__first__bit1 main__r__hd__last__bit1))

;; main__r__hd__position_axiom
  (assert (<= 0 main__r__hd__position1))

(declare-const main__r__c__first__bit1 Int)

(declare-const main__r__c__last__bit1 Int)

(declare-const main__r__c__position1 Int)

;; main__r__c__first__bit_axiom
  (assert (<= 0 main__r__c__first__bit1))

;; main__r__c__last__bit_axiom
  (assert (< main__r__c__first__bit1 main__r__c__last__bit1))

;; main__r__c__position_axiom
  (assert (<= 0 main__r__c__position1))

(declare-fun user_eq3 (us_rep1 us_rep1) Bool)

(declare-const dummy3 us_rep1)

(declare-datatypes ((tyS__ref 0))
(((tyS__refqtmk (tyS__content us_rep1)))))
(define-fun tyS__ref_tyS__content__projection ((a tyS__ref)) us_rep1 
  (tyS__content a))

(declare-const y__split_discrs us_split_discrs)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(define-fun dynamic_invariant2 ((temp___expr_196 us_rep1)
  (temp___is_init_192 Bool) (temp___skip_constant_193 Bool)
  (temp___do_toplevel_194 Bool)
  (temp___do_typ_inv_195 Bool)) Bool (and
                                     (=>
                                     (not (= temp___skip_constant_193 true))
                                     (in_range2 l h
                                     (us_split_discrs1
                                     (to_base temp___expr_196))))
                                     (and (dynamic_property l h
                                     (first1
                                     (rec__main__r__c1
                                     (us_split_fields3 temp___expr_196)))
                                     (last1
                                     (rec__main__r__c1
                                     (us_split_fields3 temp___expr_196))))
                                     (and
                                     (= (first1
                                        (rec__main__r__c1
                                        (us_split_fields3 temp___expr_196))) 
                                     l)
                                     (= (last1
                                        (rec__main__r__c1
                                        (us_split_fields3 temp___expr_196))) 
                                     h)))))

(define-fun default_initial_assumption ((temp___expr_200 us_rep1)
  (temp___skip_top_level_201 Bool)) Bool (and
                                         (and
                                         (= (to_rep
                                            (rec__main__r__ld
                                            (us_split_discrs2
                                            temp___expr_200))) l)
                                         (= (to_rep
                                            (rec__main__r__hd
                                            (us_split_discrs2
                                            temp___expr_200))) h))
                                         (and
                                         (= (first1
                                            (rec__main__r__c1
                                            (us_split_fields3
                                            temp___expr_200))) l)
                                         (= (last1
                                            (rec__main__r__c1
                                            (us_split_fields3
                                            temp___expr_200))) h))))

(declare-const x us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(assert
;; defqtvc
 ;; File "main.adb", line 12, characters 0-0
  (not
  (forall ((y__split_fields us_t))
  (=> (dynamic_invariant l true false true true)
  (=> (dynamic_invariant h true false true true)
  (=> (dynamic_invariant l true false true true)
  (=> (dynamic_invariant h true false true true)
  (=> (dynamic_invariant2
  (us_repqtmk1 y__split_discrs (us_split_fieldsqtmk1 y__split_fields)) true
  false true true)
  (=> (dynamic_invariant1 x true false true true)
  (let ((temp___246 (first1 (rec__main__r__c (us_split_fields1 x)))))
  (let ((temp___247 (last1 (rec__main__r__c (us_split_fields1 x)))))
  (forall ((j Int))
  (=> (= j temp___246)
  (=>
  (= (and (ite (<= temp___246 j) true false) (ite (<= j temp___247) true
                                             false)) true)
  (forall ((y__split_fields1 us_t) (j1 Int))
  (=>
  (= (and (ite (and (dynamic_invariant2
               (us_repqtmk1 y__split_discrs
               (us_split_fieldsqtmk1 y__split_fields1)) true true true true)
               (forall ((temp___254 Int))
               (=>
               (and (<= (first1 y__split_fields1) temp___254)
               (<= temp___254 (last1 y__split_fields1)))
               (=>
               (or (< temp___247 temp___254)
               (or (< temp___254 temp___246) (<= j1 temp___254)))
               (= (select (to_array y__split_fields1) temp___254) (select 
               (to_array y__split_fields) temp___254))))))
          true false) (ite (and
                           (<= (first1
                               (rec__main__r__c (us_split_fields1 x))) j1)
                           (<= j1 (last1
                                  (rec__main__r__c (us_split_fields1 x)))))
                      true false)) true)
  (<= (first1 y__split_fields1) j1)))))))))))))))))
(check-sat)
(exit)
