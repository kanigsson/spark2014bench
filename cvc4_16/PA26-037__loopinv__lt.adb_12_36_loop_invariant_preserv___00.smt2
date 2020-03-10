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

(declare-sort bit 0)

(declare-fun bitqtint (bit) Int)

;; bit'axiom
  (assert (forall ((i bit)) (and (<= 0 (bitqtint i)) (<= (bitqtint i) 1))))

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (bit bit) Bool)

(declare-const dummy1 bit)

(declare-datatypes ((bit__ref 0))
(((bit__refqtmk (bit__content bit)))))
(define-fun bit__ref_bit__content__projection ((a bit__ref)) bit (bit__content
                                                                 a))

(define-fun to_rep ((x bit)) Int (bitqtint x))

(declare-fun of_rep (Int) bit)

;; inversion_axiom
  (assert
  (forall ((x bit)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x bit)) (! (in_range2 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int bit))))))
(declare-fun slide ((Array Int bit) Int Int) (Array Int bit))

;; slide_eq
  (assert
  (forall ((a (Array Int bit)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int bit)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int bit)) (a__first Int) (a__last Int)
  (b (Array Int bit)) (b__first Int)
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
  (forall ((a (Array Int bit)) (b (Array Int bit)))
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

(declare-const dummy2 (Array Int bit))

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

(declare-fun user_eq2 ((Array Int bit) (Array Int bit)) Bool)

(declare-datatypes ((map__ref1 0))
(((map__refqtmk1 (map__content1 (Array Int (Array Int bit)))))))
(declare-fun slide1 ((Array Int (Array Int bit)) Int
  Int) (Array Int (Array Int bit)))

;; slide_eq
  (assert
  (forall ((a (Array Int (Array Int bit))))
  (forall ((first Int))
  (! (= (slide1 a first first) a) :pattern ((slide1 a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int (Array Int bit))))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide1 a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide1 a old_first new_first) i)) ))))))

(define-fun bool_eq1 ((a (Array Int (Array Int bit))) (a__first Int)
  (a__last Int) (b (Array Int (Array Int bit))) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_155 Int))
                           (=>
                           (and (<= a__first temp___idx_155)
                           (<= temp___idx_155 a__last))
                           (= (bool_eq (select a temp___idx_155) 0 9
                              (select b (+ (- b__first a__first) temp___idx_155))
                              0 9) true))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int (Array Int bit))) (b (Array Int (Array Int bit))))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq1 b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_155 Int))
  (=> (and (<= a__first temp___idx_155) (<= temp___idx_155 a__last))
  (= (bool_eq (select a temp___idx_155) 0 9
     (select b (+ (- b__first a__first) temp___idx_155)) 0 9) true))))))))

(declare-const x (Array Int (Array Int bit)))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-sort n 0)

(declare-fun nqtint (n) Int)

;; n'axiom
  (assert (forall ((i n)) (and (<= 0 (nqtint i)) (<= (nqtint i) 9))))

(define-fun in_range3 ((x1 Int)) Bool (and (<= 0 x1) (<= x1 9)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq3 (n n) Bool)

(declare-const dummy3 n)

(declare-datatypes ((n__ref 0))
(((n__refqtmk (n__content n)))))
(define-fun n__ref_n__content__projection ((a n__ref)) n (n__content a))

(declare-sort sum 0)

(declare-fun sumqtint (sum) Int)

;; sum'axiom
  (assert (forall ((i sum)) (and (<= 0 (sumqtint i)) (<= (sumqtint i) 100))))

(define-fun in_range4 ((x1 Int)) Bool (and (<= 0 x1) (<= x1 100)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq4 (sum sum) Bool)

(declare-const dummy4 sum)

(declare-datatypes ((sum__ref 0))
(((sum__refqtmk (sum__content sum)))))
(define-fun sum__ref_sum__content__projection ((a sum__ref)) sum (sum__content
                                                                 a))

(define-fun dynamic_invariant ((temp___expr_175 Int)
  (temp___is_init_171 Bool) (temp___skip_constant_172 Bool)
  (temp___do_toplevel_173 Bool)
  (temp___do_typ_inv_174 Bool)) Bool (=>
                                     (or (= temp___is_init_171 true)
                                     (<= 0 100)) (in_range4 temp___expr_175)))

(define-fun dynamic_invariant1 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(define-fun dynamic_invariant2 ((temp___expr_161 Int)
  (temp___is_init_157 Bool) (temp___skip_constant_158 Bool)
  (temp___do_toplevel_159 Bool)
  (temp___do_typ_inv_160 Bool)) Bool (=>
                                     (or (= temp___is_init_157 true)
                                     (<= 0 1)) (in_range2 temp___expr_161)))

(define-fun dynamic_invariant3 ((temp___expr_168 Int)
  (temp___is_init_164 Bool) (temp___skip_constant_165 Bool)
  (temp___do_toplevel_166 Bool)
  (temp___do_typ_inv_167 Bool)) Bool (=>
                                     (or (= temp___is_init_164 true)
                                     (<= 0 9)) (in_range3 temp___expr_168)))

(assert
;; defqtvc
 ;; File "lt.ads", line 12, characters 0-0
  (not
  (forall ((r Int) (r1 Int) (i Int) (j Int) (o Int))
  (=> (dynamic_invariant r false false true true)
  (=> (= r1 0)
  (=> (= i 0)
  (=> (= (and (ite (<= 0 i) true false) (ite (<= i 9) true false)) true)
  (=> (= j 0)
  (=> (= (and (ite (<= 0 j) true false) (ite (<= j 9) true false)) true)
  (=> (= (to_rep (select (select x i) j)) o)
  (let ((o1 (+ r1 o)))
  (=> (in_range4 o1)
  (forall ((r2 Int))
  (=> (= r2 o1)
  (let ((o2 (* i 10)))
  (=> (in_range1 o2)
  (let ((o3 (+ o2 j)))
  (=> (in_range1 o3)
  (=> (in_range1 (+ o3 1))
  (forall ((r3 Int) (j1 Int))
  (=> (<= r3 (+ (+ (* i 10) j1) 1))
  (=>
  (= (and (ite (and (in_range3 j1) (dynamic_invariant r3 false true true
               true))
          true false) (ite (and (<= 0 j1) (<= j1 9)) true false)) true)
  (=> (not (= j1 9))
  (forall ((j2 Int))
  (=> (= j2 (+ j1 1))
  (forall ((o4 Int))
  (=> (= (to_rep (select (select x i) j2)) o4)
  (let ((o5 (+ r3 o4)))
  (=> (in_range4 o5)
  (forall ((r4 Int))
  (=> (= r4 o5)
  (let ((o6 (* i 10)))
  (=> (in_range1 o6)
  (let ((o7 (+ o6 j2)))
  (=> (in_range1 o7) (=> (in_range1 (+ o7 1)) (<= r4 (+ (+ (* i 10) j2) 1))))))))))))))))))))))))))))))))))))))
(check-sat)
(exit)
