(set-info :smt-lib-version 2.6)
(set-logic AUFBVFPDTNIRA)
(set-info :source |
Generated by: AdaCore
Generated on: 2020-03-06
Generator: SPARK
Application: Program verification for Ada
Target solver: Z3
|)
(set-info :license "https://creativecommons.org/licenses/by/4.0/")
(set-info :category "industrial")
(set-info :status unknown)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(declare-sort string 0)

(declare-datatypes () ((tuple0 (Tuple0))))
(declare-sort us_private 0)

(declare-fun private__bool_eq (us_private us_private) Bool)

(declare-const us_null_ext__ us_private)

(declare-sort us_type_of_heap 0)

(declare-datatypes ()
((us_type_of_heap__ref
 (us_type_of_heap__refqtmk (us_type_of_heap__content us_type_of_heap)))))
(declare-sort us_image 0)

(declare-datatypes () ((int__ref (int__refqtmk (int__content Int)))))
(declare-datatypes () ((bool__ref (bool__refqtmk (bool__content Bool)))))
(declare-datatypes ()
((us_fixed__ref (us_fixed__refqtmk (us_fixed__content Int)))))
(declare-datatypes () ((real__ref (real__refqtmk (real__content Real)))))
(declare-datatypes ()
((us_private__ref (us_private__refqtmk (us_private__content us_private)))))
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

(declare-datatypes ()
((integer__ref (integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

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

(declare-datatypes ()
((natural__ref (natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun dynamic_invariant1 ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range2
                                    temp___expr_39)))

(declare-sort positive 0)

(declare-fun positiveqtint (positive) Int)

;; positive'axiom
  (assert
  (forall ((i positive))
  (and (<= 1 (positiveqtint i)) (<= (positiveqtint i) 2147483647))))

(define-fun in_range3 ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (positive positive) Bool)

(declare-const dummy2 positive)

(declare-datatypes ()
((positive__ref (positive__refqtmk (positive__content positive)))))
(define-fun positive__ref_positive__content__projection ((a positive__ref)) positive 
  (positive__content a))

(declare-sort character 0)

(define-fun in_range4 ((x Int)) Bool (and (<= 0 x) (<= x 255)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq3 (character character) Bool)

(declare-const dummy3 character)

(declare-datatypes ()
((character__ref (character__refqtmk (character__content character)))))
(define-fun character__ref_character__content__projection ((a character__ref)) character 
  (character__content a))

(define-fun dynamic_invariant2 ((temp___expr_74 Int) (temp___is_init_70 Bool)
  (temp___skip_constant_71 Bool) (temp___do_toplevel_72 Bool)
  (temp___do_typ_inv_73 Bool)) Bool (=>
                                    (or (= temp___is_init_70 true)
                                    (<= 0 255)) (in_range4 temp___expr_74)))

(declare-fun to_rep (character) Int)

(declare-fun of_rep (Int) character)

;; inversion_axiom
  (assert
  (forall ((x character))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x character)) (! (in_range4 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range4 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-datatypes ()
((map__ref (map__refqtmk (map__content (Array Int character))))))
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

(declare-fun concat1 ((Array Int character) Int Int (Array Int character) Int
  Int) (Array Int character))

;; concat_def
  (assert
  (forall ((a (Array Int character)) (b (Array Int character)))
  (forall ((a_first Int) (a_last Int) (b_first Int) (b_last Int))
  (forall ((i Int))
  (! (and
     (=> (and (<= a_first i) (<= i a_last))
     (= (select (concat1 a a_first a_last b b_first b_last) i) (select a i)))
     (=> (< a_last i)
     (= (select (concat1 a a_first a_last b b_first b_last) i) (select b (+ (- i a_last) (- b_first 1)))))) :pattern ((select 
  (concat1 a a_first a_last b b_first b_last) i)) )))))

(declare-fun concat_singleton_left (character Int (Array Int character) Int
  Int) (Array Int character))

;; concat_singleton_left_def
  (assert
  (forall ((a character))
  (forall ((b (Array Int character)))
  (forall ((a_first Int) (b_first Int) (b_last Int))
  (! (and
     (= (select (concat_singleton_left a a_first b b_first b_last) a_first) a)
     (forall ((i Int))
     (! (=> (< a_first i)
        (= (select (concat_singleton_left a a_first b b_first b_last) i) (select b (+ (- i a_first) (- b_first 1))))) :pattern ((select 
     (concat_singleton_left a a_first b b_first b_last) i)) ))) :pattern (
  (concat_singleton_left a a_first b b_first b_last)) )))))

(declare-fun concat_singleton_right ((Array Int character) Int Int
  character) (Array Int character))

;; concat_singleton_right_def
  (assert
  (forall ((a (Array Int character)))
  (forall ((b character))
  (forall ((a_first Int) (a_last Int))
  (! (and
     (= (select (concat_singleton_right a a_first a_last b) (+ a_last 1)) b)
     (forall ((i Int))
     (! (=> (and (<= a_first i) (<= i a_last))
        (= (select (concat_singleton_right a a_first a_last b) i) (select a i))) :pattern ((select 
     (concat_singleton_right a a_first a_last b) i)) :pattern ((select a i)) ))) :pattern (
  (concat_singleton_right a a_first a_last b)) )))))

(declare-fun concat_singletons (character Int
  character) (Array Int character))

;; concat_singletons_def
  (assert
  (forall ((a character) (b character))
  (forall ((a_first Int))
  (! (and (= (select (concat_singletons a a_first b) a_first) a)
     (= (select (concat_singletons a a_first b) (+ a_first 1)) b)) :pattern (
  (concat_singletons a a_first b)) ))))

(declare-fun singleton1 (character Int) (Array Int character))

;; singleton_def
  (assert
  (forall ((v character))
  (forall ((i Int))
  (! (= (select (singleton1 v i) i) v) :pattern ((select (singleton1 v i) i)) ))))

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

(declare-sort t 0)

(declare-fun first (t) integer)

(declare-fun last (t) integer)

(declare-fun mk (Int Int) t)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range1 f)
     (=> (in_range1 l)
     (and (= (to_rep1 (first (mk f l))) f) (= (to_rep1 (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range1 low)
                   (and (in_range1 high)
                   (=> (<= low high) (and (in_range3 low) (in_range3 high))))))

(declare-datatypes () ((us_t (us_tqtmk (elts (Array Int character))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int character) (elts a))

(define-fun of_array ((a (Array Int character)) (f Int)
  (l Int)) us_t (us_tqtmk a (mk f l)))

(define-fun first1 ((a us_t)) Int (to_rep1 (first (rt a))))

(define-fun last1 ((a us_t)) Int (to_rep1 (last (rt a))))

(define-fun length1 ((a us_t)) Int (ite (<= (first1 a) (last1 a))
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
  (y us_t)) Bool (bool_eq (elts x) (to_rep1 (first (rt x)))
                 (to_rep1 (last (rt x))) (elts y) (to_rep1 (first (rt y)))
                 (to_rep1 (last (rt y)))))

(declare-fun user_eq4 (us_t us_t) Bool)

(declare-const dummy4 us_t)

(declare-datatypes ()
((string____ref (string____refqtmk (string____content us_t)))))
(define-fun string____ref_string____content__projection ((a string____ref)) us_t 
  (string____content a))

(declare-const v__first integer)

(declare-const v__last integer)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-sort tfirst_charS 0)

(declare-fun tfirst_charSqtint (tfirst_charS) Int)

;; tfirst_charS'axiom
  (assert
  (forall ((i tfirst_charS))
  (and (<= 1 (tfirst_charSqtint i)) (<= (tfirst_charSqtint i) 1025))))

(define-fun in_range5 ((x Int)) Bool (and (<= 1 x) (<= x 1025)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq5 (tfirst_charS tfirst_charS) Bool)

(declare-const dummy5 tfirst_charS)

(declare-datatypes ()
((tfirst_charS__ref
 (tfirst_charS__refqtmk (tfirst_charS__content tfirst_charS)))))
(define-fun tfirst_charS__ref_tfirst_charS__content__projection ((a tfirst_charS__ref)) tfirst_charS 
  (tfirst_charS__content a))

(define-fun dynamic_invariant3 ((temp___expr_207 Int)
  (temp___is_init_203 Bool) (temp___skip_constant_204 Bool)
  (temp___do_toplevel_205 Bool)
  (temp___do_typ_inv_206 Bool)) Bool (=>
                                     (or (= temp___is_init_203 true)
                                     (<= 1 1025)) (in_range5
                                     temp___expr_207)))

(declare-sort tlast_charS 0)

(declare-fun tlast_charSqtint (tlast_charS) Int)

;; tlast_charS'axiom
  (assert
  (forall ((i tlast_charS))
  (and (<= 0 (tlast_charSqtint i)) (<= (tlast_charSqtint i) 1024))))

(define-fun in_range6 ((x Int)) Bool (and (<= 0 x) (<= x 1024)))

(declare-fun attr__ATTRIBUTE_IMAGE6 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check6 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE6 (us_image) Int)

(declare-fun user_eq6 (tlast_charS tlast_charS) Bool)

(declare-const dummy6 tlast_charS)

(declare-datatypes ()
((tlast_charS__ref (tlast_charS__refqtmk (tlast_charS__content tlast_charS)))))
(define-fun tlast_charS__ref_tlast_charS__content__projection ((a tlast_charS__ref)) tlast_charS 
  (tlast_charS__content a))

(define-fun dynamic_invariant4 ((temp___expr_214 Int)
  (temp___is_init_210 Bool) (temp___skip_constant_211 Bool)
  (temp___do_toplevel_212 Bool)
  (temp___do_typ_inv_213 Bool)) Bool (=>
                                     (or (= temp___is_init_210 true)
                                     (<= 0 1024)) (in_range6
                                     temp___expr_214)))

(declare-const attr__ATTRIBUTE_ADDRESS6 Int)

(declare-const attr__ATTRIBUTE_ADDRESS7 Int)

(declare-const r32b Int)

(declare-const attr__ATTRIBUTE_ADDRESS8 Int)

(declare-const r33b Int)

(declare-const attr__ATTRIBUTE_ADDRESS9 Int)

(declare-const s__first integer)

(declare-const s__last integer)

(declare-const attr__ATTRIBUTE_ADDRESS10 Int)

(declare-const attr__ATTRIBUTE_ADDRESS11 Int)

(declare-fun to_upper (Int) Int)

(declare-fun to_upper__function_guard (Int Int) Bool)

;; to_upper__post_axiom
  (assert
  (forall ((item Int))
  (! (=> (dynamic_invariant2 item true true true true) (dynamic_invariant2
     (to_upper item) true false true true)) :pattern ((to_upper item)) )))

(declare-sort printable_character 0)

(define-fun in_range7 ((x Int)) Bool (and (<= 33 x) (<= x 126)))

(declare-fun attr__ATTRIBUTE_IMAGE7 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check7 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE7 (us_image) Int)

(declare-fun user_eq7 (printable_character printable_character) Bool)

(declare-const dummy7 printable_character)

(declare-datatypes ()
((printable_character__ref
 (printable_character__refqtmk
 (printable_character__content printable_character)))))
(define-fun printable_character__ref_printable_character__content__projection ((a printable_character__ref)) printable_character 
  (printable_character__content a))

(declare-sort tTlineSP1 0)

(declare-fun tTlineSP1qtint (tTlineSP1) Int)

;; tTlineSP1'axiom
  (assert
  (forall ((i tTlineSP1))
  (and (<= 1 (tTlineSP1qtint i)) (<= (tTlineSP1qtint i) 1024))))

(define-fun in_range8 ((x Int)) Bool (and (<= 1 x) (<= x 1024)))

(declare-fun attr__ATTRIBUTE_IMAGE8 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check8 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE8 (us_image) Int)

(declare-fun user_eq8 (tTlineSP1 tTlineSP1) Bool)

(declare-const dummy8 tTlineSP1)

(declare-datatypes ()
((tTlineSP1__ref (tTlineSP1__refqtmk (tTlineSP1__content tTlineSP1)))))
(define-fun tTlineSP1__ref_tTlineSP1__content__projection ((a tTlineSP1__ref)) tTlineSP1 
  (tTlineSP1__content a))

(declare-datatypes () ((t35b__ref (t35b__refqtmk (t35b__content us_t)))))
(define-fun t35b__ref_t35b__content__projection ((a t35b__ref)) us_t 
  (t35b__content a))

(declare-datatypes () ((t38b__ref (t38b__refqtmk (t38b__content us_t)))))
(define-fun t38b__ref_t38b__content__projection ((a t38b__ref)) us_t 
  (t38b__content a))

(declare-fun temp_____aggregate_def_251 (Int Int Int) us_t)

(define-fun dynamic_invariant5 ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range3
                                    temp___expr_46)))

(define-fun dynamic_invariant6 ((temp___expr_96 us_t)
  (temp___is_init_92 Bool) (temp___skip_constant_93 Bool)
  (temp___do_toplevel_94 Bool)
  (temp___do_typ_inv_95 Bool)) Bool (=>
                                    (not (= temp___skip_constant_93 true))
                                    (dynamic_property 1 2147483647
                                    (first1 temp___expr_96)
                                    (last1 temp___expr_96))))

(define-fun dynamic_invariant7 ((temp___expr_190 Int)
  (temp___is_init_186 Bool) (temp___skip_constant_187 Bool)
  (temp___do_toplevel_188 Bool)
  (temp___do_typ_inv_189 Bool)) Bool (=>
                                     (or (= temp___is_init_186 true)
                                     (<= 33 126)) (in_range7
                                     temp___expr_190)))

;; def_axiom
  (assert
  (forall ((temp___253 Int) (temp___254 Int) (temp___255 Int))
  (let ((temp___252 (temp_____aggregate_def_251 temp___253 temp___254
                    temp___255)))
  (=> (dynamic_invariant2 temp___253 true true true true)
  (and
  (=> (dynamic_property 1 2147483647 temp___254 temp___255)
  (and (= (first1 temp___252) temp___254) (= (last1 temp___252) temp___255)))
  (forall ((temp___256 Int))
  (= (to_rep (select (to_array temp___252) temp___256)) temp___253)))))))

(declare-const size Int)

(declare-const line (Array Int character))

(declare-const first_char Int)

(declare-const last_char Int)

(declare-const line_num Int)

(declare-const start Int)

(declare-const current_char Int)

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant3 first_char true false true true))

;; Assume
  (assert (dynamic_invariant4 last_char true false true true))

;; Assume
  (assert (dynamic_invariant1 line_num true false true true))

;; Assume
  (assert (dynamic_property 1 2147483647 (to_rep1 v__first)
  (to_rep1 v__last)))

;; Assume
  (assert (dynamic_invariant size false false true true))

;; Assume
  (assert (<= 1024 (length (to_rep1 v__first) (to_rep1 v__last))))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant1 start false false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant2 current_char false false true true))

(declare-const line1 (Array Int character))

(declare-const first_char1 Int)

;; H
  (assert
  (ite (<= first_char 1024)
  (exists ((first_char2 Int) (last_char1 Int) (line_num1 Int)
  (current_char1 Int))
  (and
  (= (and (ite (and
               (and
               (and (dynamic_invariant3 first_char2 true true true true)
               (dynamic_invariant2 current_char1 false true true true))
               (dynamic_invariant4 last_char1 true true true true))
               (dynamic_invariant1 line_num1 true true true true))
          true false) (ite (<= first_char2 1024) true false)) true)
  (exists ((last_char2 Int) (line_num2 Int) (current_char2 Int))
  (and
  (and
  (and
  (and (dynamic_invariant2 current_char2 true true true true)
  (dynamic_invariant3 first_char1 true true true true)) (dynamic_invariant4
  last_char2 true true true true)) (dynamic_invariant1 line_num2 true true
  true true)) (or (in_range7 current_char2) (not (<= first_char1 1024)))))))
  (and (= line1 line) (= first_char1 first_char))))

(declare-const spark__branch Bool)

;; H
  (assert (= spark__branch (ite (<= 1 (- first_char1 1)) true false)))

;; H
  (assert (= spark__branch true))

(assert
;; defqtvc
 ;; File "input.ads", line 9, characters 0-0
  (not (in_range5 (- first_char1 1))))
(check-sat)
