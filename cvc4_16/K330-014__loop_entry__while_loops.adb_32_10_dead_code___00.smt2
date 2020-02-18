;; produced by cvc4_16.drv ;;
(set-logic AUFBVFPDTNIRA)
(set-info :smt-lib-version 2.6)
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

(define-fun dynamic_invariant ((temp___expr_39 Int) (temp___is_init_35 Bool)
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

(declare-datatypes ((positive__ref 0))
(((positive__refqtmk (positive__content positive)))))
(define-fun positive__ref_positive__content__projection ((a positive__ref)) positive 
  (positive__content a))

(declare-sort character 0)

(define-fun in_range4 ((x Int)) Bool (and (<= 0 x) (<= x 255)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq3 (character character) Bool)

(declare-const dummy3 character)

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
  (forall ((x character)) (! (in_range4 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range4 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
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

(declare-datatypes ((us_t 0))
(((us_tqtmk (elts (Array Int character))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int character) (elts a))

(define-fun of_array ((a (Array Int character)) (f Int)
  (l Int)) us_t (us_tqtmk a (mk f l)))

(define-fun first1 ((a us_t)) Int (to_rep1 (first (rt a))))

(define-fun last1 ((a us_t)) Int (to_rep1 (last (rt a))))

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
  (y us_t)) Bool (bool_eq (elts x) (to_rep1 (first (rt x)))
                 (to_rep1 (last (rt x))) (elts y) (to_rep1 (first (rt y)))
                 (to_rep1 (last (rt y)))))

(declare-fun user_eq4 (us_t us_t) Bool)

(declare-const dummy4 us_t)

(declare-datatypes ((string____ref 0))
(((string____refqtmk (string____content us_t)))))
(define-fun string____ref_string____content__projection ((a string____ref)) us_t 
  (string____content a))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-fun line_length (us_private us_private us_private us_private
  us_private us_private us_private) Int)

(declare-fun line_length__function_guard (Int us_private us_private
  us_private us_private us_private us_private us_private) Bool)

(declare-fun page_length (us_private us_private us_private us_private
  us_private us_private us_private) Int)

(declare-fun page_length__function_guard (Int us_private us_private
  us_private us_private us_private us_private us_private) Bool)

(declare-fun sum_of (Int) Int)

(declare-fun sum_of__function_guard (Int Int) Bool)

;; sum_of__post_axiom
  (assert
  (forall ((val__ Int)) (! (in_range2
  (sum_of val__)) :pattern ((sum_of val__)) )))

(declare-fun temp___String_Literal_186 (tuple0) (Array Int character))

;; temp___String_Literal_186__def_axiom
  (assert
  (forall ((us_void_param tuple0))
  (! (and
     (and
     (= (to_rep (select (temp___String_Literal_186 us_void_param) 1)) 87)
     (= (to_rep (select (temp___String_Literal_186 us_void_param) 2)) 104))
     (and
     (and
     (and
     (and
     (= (to_rep (select (temp___String_Literal_186 us_void_param) 3)) 105)
     (= (to_rep (select (temp___String_Literal_186 us_void_param) 4)) 108))
     (= (to_rep (select (temp___String_Literal_186 us_void_param) 5)) 101))
     (and
     (= (to_rep (select (temp___String_Literal_186 us_void_param) 6)) 32)
     (= (to_rep (select (temp___String_Literal_186 us_void_param) 7)) 108)))
     (and
     (and
     (= (to_rep (select (temp___String_Literal_186 us_void_param) 8)) 111)
     (= (to_rep (select (temp___String_Literal_186 us_void_param) 9)) 111))
     (and
     (= (to_rep (select (temp___String_Literal_186 us_void_param) 10)) 112)
     (= (to_rep (select (temp___String_Literal_186 us_void_param) 11)) 115))))) :pattern (
  (temp___String_Literal_186 us_void_param)) )))

(declare-fun temp___String_Literal_187 (tuple0) (Array Int character))

;; temp___String_Literal_187__def_axiom
  (assert
  (forall ((us_void_param tuple0))
  (! (and
     (and
     (= (to_rep (select (temp___String_Literal_187 us_void_param) 1)) 69)
     (= (to_rep (select (temp___String_Literal_187 us_void_param) 2)) 82))
     (and
     (and
     (and
     (and
     (and
     (= (to_rep (select (temp___String_Literal_187 us_void_param) 3)) 82)
     (= (to_rep (select (temp___String_Literal_187 us_void_param) 4)) 79))
     (and
     (= (to_rep (select (temp___String_Literal_187 us_void_param) 5)) 82)
     (= (to_rep (select (temp___String_Literal_187 us_void_param) 6)) 32)))
     (and
     (and
     (= (to_rep (select (temp___String_Literal_187 us_void_param) 7)) 49)
     (= (to_rep (select (temp___String_Literal_187 us_void_param) 8)) 58))
     (and
     (= (to_rep (select (temp___String_Literal_187 us_void_param) 9)) 32)
     (= (to_rep (select (temp___String_Literal_187 us_void_param) 10)) 108))))
     (and
     (and
     (and
     (= (to_rep (select (temp___String_Literal_187 us_void_param) 11)) 111)
     (= (to_rep (select (temp___String_Literal_187 us_void_param) 12)) 111))
     (and
     (= (to_rep (select (temp___String_Literal_187 us_void_param) 13)) 112)
     (= (to_rep (select (temp___String_Literal_187 us_void_param) 14)) 32)))
     (and
     (and
     (= (to_rep (select (temp___String_Literal_187 us_void_param) 15)) 115)
     (= (to_rep (select (temp___String_Literal_187 us_void_param) 16)) 104))
     (= (to_rep (select (temp___String_Literal_187 us_void_param) 17)) 111))))
     (and
     (and
     (and
     (and
     (= (to_rep (select (temp___String_Literal_187 us_void_param) 18)) 117)
     (= (to_rep (select (temp___String_Literal_187 us_void_param) 19)) 108))
     (and
     (= (to_rep (select (temp___String_Literal_187 us_void_param) 20)) 100)
     (= (to_rep (select (temp___String_Literal_187 us_void_param) 21)) 32)))
     (and
     (and
     (= (to_rep (select (temp___String_Literal_187 us_void_param) 22)) 110)
     (= (to_rep (select (temp___String_Literal_187 us_void_param) 23)) 111))
     (and
     (= (to_rep (select (temp___String_Literal_187 us_void_param) 24)) 116)
     (= (to_rep (select (temp___String_Literal_187 us_void_param) 25)) 32))))
     (and
     (and
     (and
     (= (to_rep (select (temp___String_Literal_187 us_void_param) 26)) 101)
     (= (to_rep (select (temp___String_Literal_187 us_void_param) 27)) 120))
     (and
     (= (to_rep (select (temp___String_Literal_187 us_void_param) 28)) 101)
     (= (to_rep (select (temp___String_Literal_187 us_void_param) 29)) 99)))
     (and
     (and
     (= (to_rep (select (temp___String_Literal_187 us_void_param) 30)) 117)
     (= (to_rep (select (temp___String_Literal_187 us_void_param) 31)) 116))
     (= (to_rep (select (temp___String_Literal_187 us_void_param) 32)) 101)))))) :pattern (
  (temp___String_Literal_187 us_void_param)) )))

(declare-fun temp___String_Literal_193 (tuple0) (Array Int character))

;; temp___String_Literal_193__def_axiom
  (assert
  (forall ((us_void_param tuple0))
  (! (and
     (and
     (= (to_rep (select (temp___String_Literal_193 us_void_param) 1)) 69)
     (= (to_rep (select (temp___String_Literal_193 us_void_param) 2)) 82))
     (and
     (and
     (and
     (and
     (and
     (= (to_rep (select (temp___String_Literal_193 us_void_param) 3)) 82)
     (= (to_rep (select (temp___String_Literal_193 us_void_param) 4)) 79))
     (and
     (= (to_rep (select (temp___String_Literal_193 us_void_param) 5)) 82)
     (= (to_rep (select (temp___String_Literal_193 us_void_param) 6)) 32)))
     (and
     (and
     (= (to_rep (select (temp___String_Literal_193 us_void_param) 7)) 50)
     (= (to_rep (select (temp___String_Literal_193 us_void_param) 8)) 58))
     (and
     (= (to_rep (select (temp___String_Literal_193 us_void_param) 9)) 32)
     (= (to_rep (select (temp___String_Literal_193 us_void_param) 10)) 105))))
     (and
     (and
     (and
     (= (to_rep (select (temp___String_Literal_193 us_void_param) 11)) 110)
     (= (to_rep (select (temp___String_Literal_193 us_void_param) 12)) 118))
     (and
     (= (to_rep (select (temp___String_Literal_193 us_void_param) 13)) 97)
     (= (to_rep (select (temp___String_Literal_193 us_void_param) 14)) 114)))
     (and
     (and
     (= (to_rep (select (temp___String_Literal_193 us_void_param) 15)) 105)
     (= (to_rep (select (temp___String_Literal_193 us_void_param) 16)) 97))
     (= (to_rep (select (temp___String_Literal_193 us_void_param) 17)) 110))))
     (and
     (and
     (and
     (and
     (= (to_rep (select (temp___String_Literal_193 us_void_param) 18)) 116)
     (= (to_rep (select (temp___String_Literal_193 us_void_param) 19)) 32))
     (and
     (= (to_rep (select (temp___String_Literal_193 us_void_param) 20)) 100)
     (= (to_rep (select (temp___String_Literal_193 us_void_param) 21)) 105)))
     (and
     (and
     (= (to_rep (select (temp___String_Literal_193 us_void_param) 22)) 100)
     (= (to_rep (select (temp___String_Literal_193 us_void_param) 23)) 32))
     (= (to_rep (select (temp___String_Literal_193 us_void_param) 24)) 110)))
     (and
     (and
     (and
     (= (to_rep (select (temp___String_Literal_193 us_void_param) 25)) 111)
     (= (to_rep (select (temp___String_Literal_193 us_void_param) 26)) 116))
     (and
     (= (to_rep (select (temp___String_Literal_193 us_void_param) 27)) 32)
     (= (to_rep (select (temp___String_Literal_193 us_void_param) 28)) 102)))
     (and
     (and
     (= (to_rep (select (temp___String_Literal_193 us_void_param) 29)) 97)
     (= (to_rep (select (temp___String_Literal_193 us_void_param) 30)) 105))
     (= (to_rep (select (temp___String_Literal_193 us_void_param) 31)) 108)))))) :pattern (
  (temp___String_Literal_193 us_void_param)) )))

(declare-fun temp___String_Literal_199 (tuple0) (Array Int character))

;; temp___String_Literal_199__def_axiom
  (assert
  (forall ((us_void_param tuple0))
  (! (and
     (and
     (= (to_rep (select (temp___String_Literal_199 us_void_param) 1)) 69)
     (= (to_rep (select (temp___String_Literal_199 us_void_param) 2)) 82))
     (and
     (and
     (and
     (and
     (and
     (= (to_rep (select (temp___String_Literal_199 us_void_param) 3)) 82)
     (= (to_rep (select (temp___String_Literal_199 us_void_param) 4)) 79))
     (and
     (= (to_rep (select (temp___String_Literal_199 us_void_param) 5)) 82)
     (= (to_rep (select (temp___String_Literal_199 us_void_param) 6)) 32)))
     (and
     (and
     (= (to_rep (select (temp___String_Literal_199 us_void_param) 7)) 51)
     (= (to_rep (select (temp___String_Literal_199 us_void_param) 8)) 58))
     (and
     (= (to_rep (select (temp___String_Literal_199 us_void_param) 9)) 32)
     (= (to_rep (select (temp___String_Literal_199 us_void_param) 10)) 108))))
     (and
     (and
     (and
     (= (to_rep (select (temp___String_Literal_199 us_void_param) 11)) 111)
     (= (to_rep (select (temp___String_Literal_199 us_void_param) 12)) 111))
     (and
     (= (to_rep (select (temp___String_Literal_199 us_void_param) 13)) 112)
     (= (to_rep (select (temp___String_Literal_199 us_void_param) 14)) 32)))
     (and
     (and
     (= (to_rep (select (temp___String_Literal_199 us_void_param) 15)) 115)
     (= (to_rep (select (temp___String_Literal_199 us_void_param) 16)) 104))
     (= (to_rep (select (temp___String_Literal_199 us_void_param) 17)) 111))))
     (and
     (and
     (and
     (and
     (= (to_rep (select (temp___String_Literal_199 us_void_param) 18)) 117)
     (= (to_rep (select (temp___String_Literal_199 us_void_param) 19)) 108))
     (and
     (= (to_rep (select (temp___String_Literal_199 us_void_param) 20)) 100)
     (= (to_rep (select (temp___String_Literal_199 us_void_param) 21)) 32)))
     (and
     (and
     (= (to_rep (select (temp___String_Literal_199 us_void_param) 22)) 110)
     (= (to_rep (select (temp___String_Literal_199 us_void_param) 23)) 111))
     (and
     (= (to_rep (select (temp___String_Literal_199 us_void_param) 24)) 116)
     (= (to_rep (select (temp___String_Literal_199 us_void_param) 25)) 32))))
     (and
     (and
     (and
     (= (to_rep (select (temp___String_Literal_199 us_void_param) 26)) 101)
     (= (to_rep (select (temp___String_Literal_199 us_void_param) 27)) 120))
     (and
     (= (to_rep (select (temp___String_Literal_199 us_void_param) 28)) 101)
     (= (to_rep (select (temp___String_Literal_199 us_void_param) 29)) 99)))
     (and
     (and
     (= (to_rep (select (temp___String_Literal_199 us_void_param) 30)) 117)
     (= (to_rep (select (temp___String_Literal_199 us_void_param) 31)) 116))
     (= (to_rep (select (temp___String_Literal_199 us_void_param) 32)) 101)))))) :pattern (
  (temp___String_Literal_199 us_void_param)) )))

(declare-fun temp___String_Literal_205 (tuple0) (Array Int character))

;; temp___String_Literal_205__def_axiom
  (assert
  (forall ((us_void_param tuple0))
  (! (and
     (and
     (= (to_rep (select (temp___String_Literal_205 us_void_param) 1)) 69)
     (= (to_rep (select (temp___String_Literal_205 us_void_param) 2)) 82))
     (and
     (and
     (and
     (and
     (and
     (= (to_rep (select (temp___String_Literal_205 us_void_param) 3)) 82)
     (= (to_rep (select (temp___String_Literal_205 us_void_param) 4)) 79))
     (and
     (= (to_rep (select (temp___String_Literal_205 us_void_param) 5)) 82)
     (= (to_rep (select (temp___String_Literal_205 us_void_param) 6)) 32)))
     (and
     (and
     (= (to_rep (select (temp___String_Literal_205 us_void_param) 7)) 52)
     (= (to_rep (select (temp___String_Literal_205 us_void_param) 8)) 58))
     (and
     (= (to_rep (select (temp___String_Literal_205 us_void_param) 9)) 32)
     (= (to_rep (select (temp___String_Literal_205 us_void_param) 10)) 108))))
     (and
     (and
     (and
     (= (to_rep (select (temp___String_Literal_205 us_void_param) 11)) 111)
     (= (to_rep (select (temp___String_Literal_205 us_void_param) 12)) 111))
     (and
     (= (to_rep (select (temp___String_Literal_205 us_void_param) 13)) 112)
     (= (to_rep (select (temp___String_Literal_205 us_void_param) 14)) 32)))
     (and
     (and
     (= (to_rep (select (temp___String_Literal_205 us_void_param) 15)) 115)
     (= (to_rep (select (temp___String_Literal_205 us_void_param) 16)) 104))
     (= (to_rep (select (temp___String_Literal_205 us_void_param) 17)) 111))))
     (and
     (and
     (and
     (and
     (= (to_rep (select (temp___String_Literal_205 us_void_param) 18)) 117)
     (= (to_rep (select (temp___String_Literal_205 us_void_param) 19)) 108))
     (and
     (= (to_rep (select (temp___String_Literal_205 us_void_param) 20)) 100)
     (= (to_rep (select (temp___String_Literal_205 us_void_param) 21)) 32)))
     (and
     (and
     (= (to_rep (select (temp___String_Literal_205 us_void_param) 22)) 110)
     (= (to_rep (select (temp___String_Literal_205 us_void_param) 23)) 111))
     (and
     (= (to_rep (select (temp___String_Literal_205 us_void_param) 24)) 116)
     (= (to_rep (select (temp___String_Literal_205 us_void_param) 25)) 32))))
     (and
     (and
     (and
     (= (to_rep (select (temp___String_Literal_205 us_void_param) 26)) 101)
     (= (to_rep (select (temp___String_Literal_205 us_void_param) 27)) 120))
     (and
     (= (to_rep (select (temp___String_Literal_205 us_void_param) 28)) 101)
     (= (to_rep (select (temp___String_Literal_205 us_void_param) 29)) 99)))
     (and
     (and
     (= (to_rep (select (temp___String_Literal_205 us_void_param) 30)) 117)
     (= (to_rep (select (temp___String_Literal_205 us_void_param) 31)) 116))
     (= (to_rep (select (temp___String_Literal_205 us_void_param) 32)) 101)))))) :pattern (
  (temp___String_Literal_205 us_void_param)) )))

(define-fun dynamic_invariant1 ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range3
                                    temp___expr_46)))

(define-fun dynamic_invariant2 ((temp___expr_74 Int) (temp___is_init_70 Bool)
  (temp___skip_constant_71 Bool) (temp___do_toplevel_72 Bool)
  (temp___do_typ_inv_73 Bool)) Bool (=>
                                    (or (= temp___is_init_70 true)
                                    (<= 0 255)) (in_range4 temp___expr_74)))

(define-fun dynamic_invariant3 ((temp___expr_96 us_t)
  (temp___is_init_92 Bool) (temp___skip_constant_93 Bool)
  (temp___do_toplevel_94 Bool)
  (temp___do_typ_inv_95 Bool)) Bool (=>
                                    (not (= temp___skip_constant_93 true))
                                    (dynamic_property 1 2147483647
                                    (first1 temp___expr_96)
                                    (last1 temp___expr_96))))

(define-fun dynamic_invariant4 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(declare-sort count 0)

(declare-fun countqtint (count) Int)

;; count'axiom
  (assert
  (forall ((i count))
  (and (<= 0 (countqtint i)) (<= (countqtint i) 2147483647))))

(define-fun in_range5 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq5 (count count) Bool)

(declare-const dummy5 count)

(declare-datatypes ((count__ref 0))
(((count__refqtmk (count__content count)))))
(define-fun count__ref_count__content__projection ((a count__ref)) count 
  (count__content a))

(define-fun dynamic_invariant5 ((temp___expr_161 Int)
  (temp___is_init_157 Bool) (temp___skip_constant_158 Bool)
  (temp___do_toplevel_159 Bool)
  (temp___do_typ_inv_160 Bool)) Bool (=>
                                     (or (= temp___is_init_157 true)
                                     (<= 0 2147483647)) (in_range5
                                     temp___expr_161)))

;; line_length__post_axiom
  (assert
  (forall ((ada___ada__text_io__standard_in us_private)
  (ada___ada__text_io__file_system us_private)
  (ada___ada__text_io__standard_out us_private)
  (ada___ada__text_io__standard_err us_private)
  (ada___ada__text_io__current_in us_private)
  (ada___ada__text_io__current_out us_private)
  (ada___ada__text_io__current_err us_private)) (! (dynamic_invariant5
  (line_length ada___ada__text_io__standard_in
  ada___ada__text_io__file_system ada___ada__text_io__standard_out
  ada___ada__text_io__standard_err ada___ada__text_io__current_in
  ada___ada__text_io__current_out ada___ada__text_io__current_err) true false
  true
  true) :pattern ((line_length ada___ada__text_io__standard_in
                  ada___ada__text_io__file_system
                  ada___ada__text_io__standard_out
                  ada___ada__text_io__standard_err
                  ada___ada__text_io__current_in
                  ada___ada__text_io__current_out
                  ada___ada__text_io__current_err)) )))

;; page_length__post_axiom
  (assert
  (forall ((ada___ada__text_io__standard_in us_private)
  (ada___ada__text_io__file_system us_private)
  (ada___ada__text_io__standard_out us_private)
  (ada___ada__text_io__standard_err us_private)
  (ada___ada__text_io__current_in us_private)
  (ada___ada__text_io__current_out us_private)
  (ada___ada__text_io__current_err us_private)) (! (dynamic_invariant5
  (page_length ada___ada__text_io__standard_in
  ada___ada__text_io__file_system ada___ada__text_io__standard_out
  ada___ada__text_io__standard_err ada___ada__text_io__current_in
  ada___ada__text_io__current_out ada___ada__text_io__current_err) true false
  true
  true) :pattern ((page_length ada___ada__text_io__standard_in
                  ada___ada__text_io__file_system
                  ada___ada__text_io__standard_out
                  ada___ada__text_io__standard_err
                  ada___ada__text_io__current_in
                  ada___ada__text_io__current_out
                  ada___ada__text_io__current_err)) )))

(assert
;; defqtvc
 ;; File "while_loops.adb", line 5, characters 0-0
  (not
  (forall ((standard_in us_private) (file_system us_private)
  (standard_out us_private) (standard_err us_private) (current_in us_private)
  (current_out us_private) (current_err us_private) (counter Int)
  (standard_in1 us_private) (file_system1 us_private)
  (standard_out1 us_private) (standard_err1 us_private)
  (current_in1 us_private) (current_out1 us_private)
  (current_err1 us_private) (counter1 Int) (standard_in2 us_private)
  (file_system2 us_private) (standard_out2 us_private)
  (standard_err2 us_private) (current_in2 us_private)
  (current_out2 us_private) (current_err2 us_private))
  (=> (= counter 1)
  (=> (dynamic_invariant counter true false true true)
  (=>
  (= (line_length standard_in file_system standard_out standard_err
     current_in current_out current_err) (line_length standard_in1
                                         file_system1 standard_out1
                                         standard_err1 current_in1
                                         current_out1 current_err1))
  (=>
  (= (page_length standard_in file_system standard_out standard_err
     current_in current_out current_err) (page_length standard_in1
                                         file_system1 standard_out1
                                         standard_err1 current_in1
                                         current_out1 current_err1))
  (=>
  (forall ((counter2 Int)) (sum_of__function_guard (sum_of counter2)
  counter2))
  (=>
  (forall ((counter2 Int)) (sum_of__function_guard (sum_of counter2)
  counter2))
  (=>
  (let ((o (sum_of counter)))
  (and
  (and (sum_of__function_guard o counter) (dynamic_invariant o true false
  true true))
  (ite (< 5 o)
  (exists ((standard_in3 us_private) (file_system3 us_private)
  (standard_out3 us_private) (standard_err3 us_private)
  (current_in3 us_private) (current_out3 us_private)
  (current_err3 us_private))
  (and
  (and
  (= (line_length standard_in1 file_system1 standard_out1 standard_err1
     current_in1 current_out1 current_err1) (line_length standard_in3
                                            file_system3 standard_out3
                                            standard_err3 current_in3
                                            current_out3 current_err3))
  (= (page_length standard_in1 file_system1 standard_out1 standard_err1
     current_in1 current_out1 current_err1) (page_length standard_in3
                                            file_system3 standard_out3
                                            standard_err3 current_in3
                                            current_out3 current_err3)))
  (exists ((counter2 Int))
  (and (< 0 (sum_of counter))
  (and (dynamic_invariant counter2 true true true true)
  (let ((o1 (+ counter2 1)))
  (and (in_range1 o1)
  (and (= counter1 o1)
  (let ((o2 (sum_of counter1)))
  (and
  (and (sum_of__function_guard o2 counter1) (dynamic_invariant o2 true false
  true true)) (not (< 5 o2))))))))))))
  (and
  (and
  (and
  (and
  (and
  (and (and (= counter1 counter) (= standard_in2 standard_in1))
  (= file_system2 file_system1)) (= standard_out2 standard_out1))
  (= standard_err2 standard_err1)) (= current_in2 current_in1))
  (= current_out2 current_out1)) (= current_err2 current_err1)))))
  (let ((o (sum_of counter1)))
  (=>
  (and (sum_of__function_guard o counter1) (dynamic_invariant o true false
  true true)) (not (< o 2))))))))))))))
(check-sat)