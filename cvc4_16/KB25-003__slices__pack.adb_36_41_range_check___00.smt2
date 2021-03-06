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

(declare-sort character 0)

(define-fun in_range ((x Int)) Bool (and (<= 0 x) (<= x 255)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (character character) Bool)

(declare-const dummy character)

(declare-datatypes ((character__ref 0))
(((character__refqtmk (character__content character)))))
(define-fun character__ref_character__content__projection ((a character__ref)) character 
  (character__content a))

(declare-fun to_rep (character) Int)

(declare-fun of_rep (Int) character)

;; inversion_axiom
  (assert
  (forall ((x character))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x character)) (! (in_range (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                           (of_rep x))) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int character))))))
(declare-fun slide ((Array Int character) Int Int) (Array Int character))

;; slide_eq
  (assert
  (forall ((a (Array Int character)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int character)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int character)) (a__first Int) (a__last Int)
  (b (Array Int character)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_91 Int))
                           (=>
                           (and (<= a__first temp___idx_91)
                           (<= temp___idx_91 a__last))
                           (= (to_rep (select a temp___idx_91)) (to_rep
                                                                (select b (+ (- b__first a__first) temp___idx_91)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int character)) (b (Array Int character)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_91 Int))
  (=> (and (<= a__first temp___idx_91) (<= temp___idx_91 a__last))
  (= (to_rep (select a temp___idx_91)) (to_rep
                                       (select b (+ (- b__first a__first) temp___idx_91)))))))))))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

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

(declare-fun user_eq1 (integer integer) Bool)

(declare-const dummy1 integer)

(declare-datatypes ((integer__ref 0))
(((integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(define-fun to_rep1 ((x integer)) Int (integerqtint x))

(declare-fun of_rep1 (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range1 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-datatypes ((map__ref1 0))
(((map__refqtmk1 (map__content1 (Array Int integer))))))
(declare-fun slide1 ((Array Int integer) Int Int) (Array Int integer))

;; slide_eq
  (assert
  (forall ((a (Array Int integer)))
  (forall ((first Int))
  (! (= (slide1 a first first) a) :pattern ((slide1 a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int integer)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide1 a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide1 a old_first new_first) i)) ))))))

(define-fun bool_eq1 ((a (Array Int integer)) (a__first Int) (a__last Int)
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
                           (= (to_rep1 (select a temp___idx_154)) (to_rep1
                                                                  (select b (+ (- b__first a__first) temp___idx_154)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int integer)) (b (Array Int integer)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq1 b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_154 Int))
  (=> (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (= (to_rep1 (select a temp___idx_154)) (to_rep1
                                         (select b (+ (- b__first a__first) temp___idx_154)))))))))))

(declare-const my_a (Array Int integer))

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const my_b (Array Int integer))

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-sort tTglobSP1 0)

(declare-fun tTglobSP1qtint (tTglobSP1) Int)

;; tTglobSP1'axiom
  (assert
  (forall ((i tTglobSP1))
  (and (<= 1 (tTglobSP1qtint i)) (<= (tTglobSP1qtint i) 26))))

(define-fun in_range2 ((x Int)) Bool (and (<= 1 x) (<= x 26)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq2 (tTglobSP1 tTglobSP1) Bool)

(declare-const dummy2 tTglobSP1)

(declare-datatypes ((tTglobSP1__ref 0))
(((tTglobSP1__refqtmk (tTglobSP1__content tTglobSP1)))))
(define-fun tTglobSP1__ref_tTglobSP1__content__projection ((a tTglobSP1__ref)) tTglobSP1 
  (tTglobSP1__content a))

(declare-sort tTmy_s2SP1 0)

(declare-fun tTmy_s2SP1qtint (tTmy_s2SP1) Int)

;; tTmy_s2SP1'axiom
  (assert
  (forall ((i tTmy_s2SP1))
  (and (<= 1 (tTmy_s2SP1qtint i)) (<= (tTmy_s2SP1qtint i) 4))))

(define-fun in_range3 ((x Int)) Bool (and (<= 1 x) (<= x 4)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq3 (tTmy_s2SP1 tTmy_s2SP1) Bool)

(declare-const dummy3 tTmy_s2SP1)

(declare-datatypes ((tTmy_s2SP1__ref 0))
(((tTmy_s2SP1__refqtmk (tTmy_s2SP1__content tTmy_s2SP1)))))
(define-fun tTmy_s2SP1__ref_tTmy_s2SP1__content__2__projection ((a tTmy_s2SP1__ref)) tTmy_s2SP1 
  (tTmy_s2SP1__content a))

(declare-sort tTmy_aSP1 0)

(declare-fun tTmy_aSP1qtint (tTmy_aSP1) Int)

;; tTmy_aSP1'axiom
  (assert
  (forall ((i tTmy_aSP1))
  (and (<= 1 (tTmy_aSP1qtint i)) (<= (tTmy_aSP1qtint i) 4))))

(define-fun in_range4 ((x Int)) Bool (and (<= 1 x) (<= x 4)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq4 (tTmy_aSP1 tTmy_aSP1) Bool)

(declare-const dummy4 tTmy_aSP1)

(declare-datatypes ((tTmy_aSP1__ref 0))
(((tTmy_aSP1__refqtmk (tTmy_aSP1__content tTmy_aSP1)))))
(define-fun tTmy_aSP1__ref_tTmy_aSP1__content__3__projection ((a tTmy_aSP1__ref)) tTmy_aSP1 
  (tTmy_aSP1__content a))

(declare-fun pack__an21__my_a__aggregate_def (Int) (Array Int integer))

(declare-sort t61b 0)

(declare-fun t61bqtint (t61b) Int)

;; t61b'axiom
  (assert
  (forall ((i t61b)) (and (<= 1 (t61bqtint i)) (<= (t61bqtint i) 3))))

(define-fun in_range5 ((x Int)) Bool (and (<= 1 x) (<= x 3)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq5 (t61b t61b) Bool)

(declare-const dummy5 t61b)

(declare-datatypes ((t61b__ref 0))
(((t61b__refqtmk (t61b__content t61b)))))
(define-fun t61b__ref_t61b__content__projection ((a t61b__ref)) t61b 
  (t61b__content a))

(declare-sort t63b 0)

(declare-fun t63bqtint (t63b) Int)

;; t63b'axiom
  (assert
  (forall ((i t63b)) (and (<= 1 (t63bqtint i)) (<= (t63bqtint i) 3))))

(define-fun in_range6 ((x Int)) Bool (and (<= 1 x) (<= x 3)))

(declare-fun attr__ATTRIBUTE_IMAGE6 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check6 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE6 (us_image) Int)

(declare-fun user_eq6 (t63b t63b) Bool)

(declare-const dummy6 t63b)

(declare-datatypes ((t63b__ref 0))
(((t63b__refqtmk (t63b__content t63b)))))
(define-fun t63b__ref_t63b__content__projection ((a t63b__ref)) t63b 
  (t63b__content a))

(declare-sort t65b 0)

(declare-fun t65bqtint (t65b) Int)

;; t65b'axiom
  (assert
  (forall ((i t65b)) (and (<= 1 (t65bqtint i)) (<= (t65bqtint i) 3))))

(define-fun in_range7 ((x Int)) Bool (and (<= 1 x) (<= x 3)))

(declare-fun attr__ATTRIBUTE_IMAGE7 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check7 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE7 (us_image) Int)

(declare-fun user_eq7 (t65b t65b) Bool)

(declare-const dummy7 t65b)

(declare-datatypes ((t65b__ref 0))
(((t65b__refqtmk (t65b__content t65b)))))
(define-fun t65b__ref_t65b__content__projection ((a t65b__ref)) t65b 
  (t65b__content a))

(declare-sort t67b 0)

(declare-fun t67bqtint (t67b) Int)

;; t67b'axiom
  (assert
  (forall ((i t67b)) (and (<= 1 (t67bqtint i)) (<= (t67bqtint i) 3))))

(define-fun in_range8 ((x Int)) Bool (and (<= 1 x) (<= x 3)))

(declare-fun attr__ATTRIBUTE_IMAGE8 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check8 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE8 (us_image) Int)

(declare-fun user_eq8 (t67b t67b) Bool)

(declare-const dummy8 t67b)

(declare-datatypes ((t67b__ref 0))
(((t67b__refqtmk (t67b__content t67b)))))
(define-fun t67b__ref_t67b__content__projection ((a t67b__ref)) t67b 
  (t67b__content a))

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(define-fun dynamic_invariant1 ((temp___expr_74 Int) (temp___is_init_70 Bool)
  (temp___skip_constant_71 Bool) (temp___do_toplevel_72 Bool)
  (temp___do_typ_inv_73 Bool)) Bool (=>
                                    (or (= temp___is_init_70 true)
                                    (<= 0 255)) (in_range temp___expr_74)))

;; my_a__def_axiom
  (assert (= my_a (pack__an21__my_a__aggregate_def 42)))

(declare-const rliteral integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral) 42))

;; def_axiom
  (assert
  (forall ((temp___168 Int))
  (=> (dynamic_invariant temp___168 true true true true)
  (forall ((temp___169 Int))
  (= (select (pack__an21__my_a__aggregate_def temp___168) temp___169) 
  rliteral)))))

;; my_b__def_axiom
  (assert (= my_b (let ((temp___171 4)) (let ((temp___170 1)) my_a))))

(assert
;; defqtvc
 ;; File "pack.adb", line 33, characters 0-0
  (not
  (forall ((glob (Array Int character)) (my_s2 (Array Int character)))
  (=> (= my_s2 glob)
  (=> (=> (<= 1 4) (and (and (<= 1 1) (<= 1 26)) (and (<= 1 4) (<= 4 26))))
  (=> (= (pack__an21__my_a__aggregate_def 42) my_a) (=> (<= 1 4) (<= 1 1))))))))
(check-sat)
(exit)
